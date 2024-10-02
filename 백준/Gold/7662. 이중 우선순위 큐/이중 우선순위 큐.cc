#include <iostream>
#include <set>

using namespace std;

int main() {
    int t;
    cin >> t;
    
    while (t--) {
        int k;
        cin >> k;
        multiset<int> ms;
        
        for (int i = 0; i < k; ++i) {
            char op;
            int num;
            cin >> op >> num;
            
            if (op == 'I') {
                ms.insert(num);
            } else if (!ms.empty()) {
                if (num == 1) {
                    ms.erase(prev(ms.end()));
                } else {
                    ms.erase(ms.begin());
                }
            }
        }
        
        if (ms.empty()) {
            cout << "EMPTY" << endl;
        } else {
            cout << *prev(ms.end()) << " " << *ms.begin() << endl;
        }
    }
}