#include <cstdio>
#include <iostream>
#include <vector>
#include <algorithm>
#include <map>
#include <string.h>
using namespace std;

typedef struct {
    int time;
    int release;
    int sub;
    int sub_max;
    vector<int> v_pri,v_sub;
}task;
task *task_p,*task_p_cp;

typedef struct {
    int start;
    int end;
    int task;
}process;
process *pro;

void *read_data(int n) {
    task_p = new task[n+1];
    task_p_cp = new task[n+1];
    for(int i = 1;i <= n;i++){
        cin >> task_p[i].time;
        task_p_cp[i].time = task_p[i].time;
    }
    for(int i = 1;i <= n;i++){
        cin >> task_p[i].release;
        task_p_cp[i].release = task_p[i].release;
    }
    for(int i = 1;i <= n;i++) {
        cin >> task_p[i].sub;
        task_p_cp[i].sub = task_p[i].sub;
        for(int j = 1;j <= task_p[i].sub;j++){
            int task_temp;
            cin >> task_temp;
            task_p[i].v_sub.push_back(task_temp);
            task_p[task_temp].v_pri.push_back(i);
            task_p_cp[i].v_sub.push_back(task_temp);
            task_p_cp[task_temp].v_pri.push_back(i);
        }
        task_p[i].sub_max = 0;
        task_p_cp[i].sub_max = 0;
    }
}

bool cmp(pair<int, int> a,pair<int, int> b) {
    if(a.second != b.second)
        return a.second > b.second;
    if(task_p[a.first].release != task_p[b.first].release)
        return task_p[a.first].release < task_p[b.first].release;
    if(task_p[a.first].time != task_p[b.first].time)
        return task_p[a.first].time > task_p[b.first].time;
    return a.first < b.first;
}

vector<pair<int, int>> TaPSA(int n) {
    /* Calculate the priority value */
    map<int,int> pri_table;
    for(int i = n;i >= 1;i--) {
        if(task_p[i].sub == 0) {
            pri_table[i] = task_p[i].time;
            int pri_num = task_p[i].v_pri.size();
            while(pri_num--) {
                int temp = task_p[i].v_pri[pri_num];
                if(task_p[temp].sub_max < pri_table[i])
                    task_p[temp].sub_max = pri_table[i];
                auto iter = remove(task_p[temp].v_sub.begin(), task_p[temp].v_sub.end(), i);
                task_p[temp].v_sub.erase(iter,task_p[temp].v_sub.end());
            }
            continue;
        }
        if(task_p[i].v_sub.size() == 0){
            pri_table[i] = task_p[i].time + task_p[i].sub + task_p[i].sub_max;
            int pri_num = task_p[i].v_pri.size();
            while(pri_num--) {
                int temp = task_p[i].v_pri[pri_num];
                if(task_p[temp].sub_max < pri_table[i])
                    task_p[temp].sub_max = pri_table[i];
                auto iter = remove(task_p[temp].v_sub.begin(), task_p[temp].v_sub.end(), i);
                task_p[temp].v_sub.erase(iter,task_p[temp].v_sub.end());
            }
        }
    }
    /* sort */
    vector<pair<int, int>> v(pri_table.begin(),pri_table.end());
    sort(v.begin(), v.end(), cmp);
    return v;
}

void init_process(int p){
    pro = new process[p+1];
    for(int i=1;i <= p;i++)
        pro[i].task=-1;
}

int get_process(int p) {
    for(int i=1;i <= p;i++){
        if(pro[i].task == -1){
            return i;
        }
    }
    return -1;
}

void back_process(int p){
    pro[p].task = -1;
}

void print_process(int p,int cnt){
    for(int i=1;i <= p;i++){
        if(pro[i].task != -1){
            printf("Time{%d}: Task{%d} running in Process{%d}\n",cnt,pro[i].task,i);
        }
    }
}

void MuPPA(int n, int p, vector<pair<int, int>> v) {
    int cnt=0,num=0,finish_table[n+1];
    vector<int> v_pro[p+1];
    for(int i = 1;i <= n;i++){
        finish_table[i] = -1;
    }
    init_process(p);
    while(num < n+1){
        int cpu = -1,target = 0;
        /* check task */
        for(int i = 1;i <= p;i++) {
            if(pro[i].task != -1){
                if(cnt >= pro[i].end){
                    /* Sub tasks can be performed */
                    for(int j = 0;j < task_p_cp[pro[i].task].v_sub.size();j++){
                        if(finish_table[task_p_cp[pro[i].task].v_sub[j]] == -2)
                            finish_table[task_p_cp[pro[i].task].v_sub[j]] = -1;
                    }
                    back_process(i);
                    int judge = 1;
                    for(judge = 1;judge <= n;judge++){
                        if(finish_table[judge] != 0)
                            break;
                    }
                    if(judge > n){
                        for(int m = 1;m <= p;m++){
                            int time = 0;
                            cout << "Process " << m << ": ";
                            for(int l = 0;l < v_pro[m].size();l++){
                                cout << v_pro[m][l] << " ";
                                time += task_p[v_pro[m][l]].time;
                            }
                            cout << endl;
                            cout << "Process " << m << " utilization rate: ";
                            cout << time << "/" << cnt << endl;
                        }
                        return;
                    }
                }
            }
        }
        /* perform task*/
        if((cpu=get_process(p)) == -1) {
            print_process(p,cnt);
            cnt++;
        }else{
            for(target = 0;target < v.size();target++) {
                if(finish_table[v[target].first] == -1)
                    break;
                if(finish_table[v[target].first] == -2)
                    continue;
                if(finish_table[v[target].first] > 0){
                    if(cnt >= finish_table[v[target].first])
                        break;
                    else
                        continue;
                }
            }
            if(target >= v.size()){
                print_process(p,cnt);
                cnt++;
            }
            else{
                int is_finish = 1;
                if(task_p[v[target].first].v_pri.size() != 0){
                    for(int j = 0;j < task_p[v[target].first].v_pri.size();j++){
                        if(finish_table[task_p[v[target].first].v_pri[j]] != 0){
                            is_finish = 0;
                            break;
                        }else{
                            for(int k = 1;k <= p;k++){
                                if(pro[k].task == task_p[v[target].first].v_pri[j]){
                                    is_finish = 0;
                                    break;
                                }
                            }
                        }
                    }
                }
                if((task_p[v[target].first].release == 0 || cnt >= task_p[v[target].first].release) && is_finish){
                    pro[cpu].task = v[target].first;
                    pro[cpu].start = cnt;
                    pro[cpu].end = task_p[v[target].first].time + cnt;
                    finish_table[v[target].first] = 0;
                    v_pro[cpu].push_back(v[target].first);
                    num++;
                }else{
                    if(task_p[v[target].first].release != 0)
                        finish_table[v[target].first] = task_p[v[target].first].release;
                    else
                        finish_table[v[target].first] = -2;  // waiting for pre task
                    continue;
                }
            }
            if((cpu=get_process(p)) != -1)
                continue;
            print_process(p,cnt);
            cnt++;
        }
    }
}

int main() {
    int n,p;
    cin >> n >> p;
    read_data(n);
    vector<pair<int, int>> v = TaPSA(n);
    MuPPA(n, p, v);
    delete [] task_p;
    return 0;
}