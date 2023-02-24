#include <iostream>

#include <vector>

using namespace std;


int main() {

    // nums - входные числа, stck - стэк, result - ответ

    vector<int> nums, stck, result;

    int count;

    std::string input;

    cin >> count;
    nums.resize(count, -1);
    for (int i = 0; i < count;i++) {
        cin >> nums[i];
    }


    result.resize(count, -1);



    // Основной алгоритм.

    for (size_t i = 0; i < nums.size(); ++i) {

        while (!stck.empty() && nums[stck.back()] > nums[i]) {

            result[stck.back()] = i;

            stck.pop_back();

        }

        stck.push_back(i);

    }



    // Выводим результат.

    for (size_t i = 0; i < result.size(); ++i) {

        if (i == result.size() - 1) {

            cout << result[i];

        }

        else {

            cout << result[i] << " ";

        }

    }



    return 0;

}
