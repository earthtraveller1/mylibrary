#pragma once

#include <functional>
#include <vector>

namespace mylibrary
{
// Says hello.
void say_hello();

// Maps over a vector.
template <typename T>
std::vector<T> map(const std::vector<T>& p_vec,
                   std::function<T(const T&)> p_func)
{
    std::vector<T> result(p_vec.size());
    for (size_t i = 0; i < p_vec.size(); i++)
    {
        result[i] = p_func(p_vec[i]);
    }

    return result;
}

} // namespace mylibrary