//
// Created by 24073 on 12/2/2022.
//
#include <cstdio>
#include <iostream>
#include <vector>
#include <algorithm>
#include <map>
using namespace std;

typedef struct {
    int time;
    int release;
    int sub;
    int sub_max;
    vector<int> v_pri,v_sub;
}task;
task *task_p;

void *read_data(int n) {
    task_p = new task[n+1];
    for(int i = 1;i <= n;i++)
        cin >> task_p[i].time;
    for(int i = 1;i <= n;i++)
        cin >> task_p[i].release;
    for(int i = 1;i <= n;i++) {
        cin >> task_p[i].sub;
        for(int j = 1;j <= task_p[i].sub;j++){
            int task_temp;
            cin >> task_temp;
            task_p[i].v_sub.push_back(task_temp);
            task_p[task_temp].v_pri.push_back(i);
        }
        task_p[i].sub_max = 0;
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

void TaPSA(int n) {
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
    for(int i=0;i<v.size();i++){
        printf("Task(%d): %d\n",v[i].first, v[i].second);
    }
}

int main() {
    int n;
    cin >> n;
    read_data(n);
    TaPSA(n);
    delete [] task_p;
    return 0;
}