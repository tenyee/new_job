#include <iostream>
#include <vector>
#include <string>
#include <memory>

using namespace std;

int main() {
    int a;
    int &b = a;
    a = 8;
    const int c = a;
    cout << a << endl;
    cout << b << endl;
    a = 3;
    cout << c << endl;

    return 0;
}
