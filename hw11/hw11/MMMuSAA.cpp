#include <iostream>
#include <vector>
#include <map>
#include <algorithm>
using namespace std;

int n;
map<string,double> mp;
vector<vector<string>> v;
typedef struct cluster{
    double weight;
    int k;
    vector<vector<string>> v;
}Cluster;
vector<Cluster> ans_v;

// 读输入数据，建立关系
double read_data(){
    int edge;
    double weight,max_weight=0;
    string task_i,task_j;
    for(int i = 0;i < n;i++){
        vector<string> temp;
        cin >> task_i >> edge;
        temp.push_back(task_i);
        v.push_back(temp);  // {{"T1"},{"T2"},...}
        for(int j = 0;j < edge;j++){
            cin >> task_j >> weight;
            if(weight > max_weight)
                max_weight = weight;
            mp[task_i+task_j] = weight;
        }
    }
    return max_weight;
}

// 单链接核心部分
double MuSSA(vector<string> v1,vector<string>v2){
    double larc = 0;
    for(int i = 0;i < v1.size();i++){
        for(int j = 0;j < v2.size();j++){
            if(mp[v1[i]+v2[j]] > larc)
                larc = mp[v1[i]+v2[j]];
        }
    }
    return larc;
}

// 公共部分，遍历逻辑
void MM(int model_num,int max_task_num,int max_weight,double cost){
    double weight = max_weight + 1;
    int k = v.size();
    Cluster temp;
    temp.weight = weight;
    temp.k = v.size();
    temp.v = v;
    ans_v.push_back(temp);
    weight = weight-1;
    while(weight != 0 && k != model_num){
        bool back = false;
        vector<vector<string>> v_temp;
        for(int i = 0;i < v.size();i++){
            v_temp.push_back(v[i]);
        }
        v.clear();
        for(int i = 0;i < v_temp.size();i++){
            for(int j = i+1;j < v_temp.size();j++){
                double larc = MuSSA(v_temp[i],v_temp[j]);
                if(larc >= weight && v_temp[i].size() + v_temp[j].size() <= max_task_num){
                    vector<string> merge_v,tmp_1,tmp_2;
                    for(int k = 0;k < v_temp[i].size();k++){
                        tmp_1.push_back(v_temp[i][k]);
                    }
                    for(int k = 0;k < v_temp[j].size();k++){
                        tmp_2.push_back(v_temp[j][k]);
                    }
                    merge_v.insert(merge_v.end(),v_temp[i].begin(),v_temp[i].end());
                    merge_v.insert(merge_v.end(),v_temp[j].begin(),v_temp[j].end());
                    v.push_back(merge_v);
                    v_temp.erase(remove(v_temp.begin(),v_temp.end(),tmp_1),v_temp.end());
                    v_temp.erase(remove(v_temp.begin(),v_temp.end(),tmp_2),v_temp.end());
                    for(int k = 0;k < v_temp.size();k++){
                        v.push_back(v_temp[k]);
                    }
                    back = true;
                    break;
                }
            }
            if(back)
                break;
        }
        if(back)
            continue;
        for(int i = 0;i < v_temp.size();i++){
            v.push_back(v_temp[i]);
        }
        temp.weight = weight;
        temp.k = v.size();
        temp.v = v;
        ans_v.push_back(temp);
        k = v.size();
        weight -= cost;
    }

}

// 展示划分结果
void show_ans(){
    for(int i = 0;i < ans_v.size();i++){
        cout << ans_v[i].weight << " " << ans_v[i].k << " \t{" ;
        for(int j = 0;j < ans_v[i].v.size();j++){
            cout << "{" << ans_v[i].v[j][0];
            for(int k = 1;k < ans_v[i].v[j].size();k++){
                cout << " " <<  ans_v[i].v[j][k];
            }
            cout << "}";
        }
        cout << "}" << endl;
    }
}

double cal(vector<string> v1,vector<string>v2){
    double larc = 0;
    for(int i = 0;i < v1.size();i++){
        for(int j = 0;j < v2.size();j++){
            if(mp[v1[i]+v2[j]] > 0)
                larc += mp[v1[i]+v2[j]];
        }
    }
    return larc;
}

// 计算通信代价
void cal_cost(){
    double all_cost;
    int dst = ans_v.size() - 1;
    for(int i = 0;i < ans_v[dst].v.size();i++){
        for(int j = i+1;j < ans_v[dst].v.size();j++){
            all_cost += cal(ans_v[dst].v[i],ans_v[dst].v[j]);
        }
    }
    cout << "all cost: " << all_cost << endl;
}

int main() {
    int model_num,max_task_num;
    double max_weight,cost;
    cin >> n >> model_num >> max_task_num >> cost;
    max_weight = read_data();
    MM(model_num,max_task_num,max_weight,cost);
    show_ans();
    cal_cost();
    return 0;
}
