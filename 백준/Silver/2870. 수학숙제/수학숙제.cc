#include <bits/stdc++.h>
using namespace std;
bool cmp(string a, string b){
	if(a.size()==b.size())
		return a<b;
	return a.size()<b.size();
}
int main()
{
    ios::sync_with_stdio(false);cin.tie(NULL);cout.tie(NULL);
    int n;
    string a, tmp;
    vector<string> num;
    cin>>n;
    while(n--){
    	string tmp="";
    	cin>>a;
    	for(int i=0;i<a.size();i++){
    		if(a[i]>='0'&&a[i]<='9')
    			tmp+=a[i];	
			else if(!tmp.empty()){
				while(tmp.size() > 1 &&tmp[0]=='0')
					tmp.erase(0,1);
				num.push_back(tmp);
				tmp="";
			}
		}
		if(!tmp.empty()){
			while(tmp.size() > 1 &&tmp[0]=='0')
				tmp.erase(0,1);	
			num.push_back(tmp);
			tmp="";
		}
	}
	sort(num.begin(),num.end(),cmp);
	for(auto v:num) cout<< v <<"\n";
    return 0;
}