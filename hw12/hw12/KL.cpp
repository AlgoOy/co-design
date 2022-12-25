#include<iostream>
#include<string>
#include<vector>
#include<map>
#include<ctime>
#include<cstdlib>
#include<windows.h>
#include<algorithm>
using namespace std;

int n;
map<string, double> mp,d;
vector<string> v,va,vb,ans_a,ans_b;
vector<double> vg;

// 读数据
void read_data(){
    cin >> n;
    for(int i = 0;i < n;i++){
        string t,tk;
        int k;
        cin >> t >> k;
        v.push_back(t);
        for(int j = 0;j < k;j++){
            double cost;
            cin >> tk >> cost;
            mp[t+tk] = cost;
        }
    }
}

// 随机初始划分
void random_partition(){
    va.clear();
    vb.clear();
    vector<string> v_temp;
    for(int i = 0;i < n;i++){
        v_temp.push_back(v[i]);
    }
    srand((unsigned)time(NULL));    // 使用当前时间初始化随机数种子
    for(int i = n;i > n/2;i--){
        int random = rand() % i;
        va.push_back(v_temp[random]);
        v_temp.erase(v_temp.begin()+random);
    }
    cout << "Results after random partition:" << endl;
    cout << "va: ";
    for(int i = 0;i < n/2;i++){
        cout << va[i] << " ";
    }
    cout << endl;
    for(int i = 0;i < n/2;i++){
        vb.push_back(v_temp[i]);
    }
    cout << "vb: ";
    for(int i = 0;i < n/2;i++){
        cout << vb[i] << " ";
    }
    cout << endl;
}

// 计算D值
void cal_d(vector<string> a, vector<string> b){
    for(int i = 0;i < a.size();i++){
        string t = a[i];
        double in = 0,out = 0;
        for(int j = 0;j < b.size();j++){
            out += mp[t+b[j]];
        }
        for(int j = 0;j < a.size();j++){
            in += mp[t+a[j]];
        }
        d[t] = out-in;
    }
}

// 计算G值
void cal_g(vector<string> &a, vector<string> &b){
    double max = d[a[0]]+d[b[0]]-2*mp[a[0]+b[0]];
    int index_a = 0,index_b = 0;
    for(int i = 0;i < a.size();i++){
        string t = a[i];
        for(int j = 0;j < b.size();j++){
            double g = d[t]+d[b[j]]-2*mp[t+b[j]];
            if(g > max){
                max = g;
                index_a = i;
                index_b = j;
            }
        }
    }
    ans_a.push_back(a[index_a]);
    ans_b.push_back(b[index_b]);
    vg.push_back(max);
    a.erase(a.begin()+index_a);
    b.erase(b.begin()+index_b);
}

// KL算法
void kl_algorithm(){
    vector<string> va_temp,vb_temp;
    for(int i = 0;i < n/2;i++){
        va_temp.push_back(va[i]);
        vb_temp.push_back(vb[i]);
    }
    cal_d(va_temp,vb_temp);
    cal_d(vb_temp,va_temp);
    for(int i = 0;i < n/2;i++){
        cal_g(va_temp,vb_temp);
        d.clear();
        cal_d(va_temp,vb_temp);
        cal_d(vb_temp,va_temp);
    }
    double max_g = 0;
    int k = 0;
    for(int i = 0;i < vg.size();i++){
        if(vg[i] < 0){
            k = i-1;
            break;
        }
        max_g += vg[i];
    }
    if(max_g > 0){
        vg.clear();
        d.clear();
        for(int i = 0;i <= k;i++){
            va.push_back(ans_b[i]);
            auto it = find(vb.begin(),vb.end(),ans_b[i]);
            vb.erase(it);
        }
        for(int i = 0;i <= k;i++){
            vb.push_back(ans_a[i]);
            auto it = find(va.begin(),va.end(),ans_a[i]);
            va.erase(it);
        }
        ans_a.clear();
        ans_b.clear();
        kl_algorithm();
    }else{
        cout << "Final partition result:" << endl;
        cout << "va: ";
        for(int i = 0;i < va.size();i++){
            cout << va[i] << " ";
        }
        cout << endl;
        cout << "vb: ";
        for(int i = 0;i < vb.size();i++){
            cout << vb[i] << " ";
        }
        cout << endl;
        ans_a.clear();
        ans_b.clear();
        vg.clear();
        d.clear();
    }
}

// 计算通信代价
double cal_cost(){
    double larc = 0;
    for(int i = 0;i < va.size();i++){
        for(int j = 0;j < vb.size();j++){
            if(mp[va[i]+vb[j]] > 0)
                larc += mp[va[i]+vb[j]];
        }
    }
    return larc;
}

int main() {
    read_data();
    for(int i = 0;i < 3;i++){
        if(i != 0){
            Sleep(1000);    // 速度太快会导致随机数种子没有得到更新，所以休眠 1s
        }
        random_partition();
        cout << "Original communication cost: " << cal_cost() << endl;
        kl_algorithm();
        cout << "Communication cost after partition: " << cal_cost << endl;
        cout << endl;
    }
    return 0;
}