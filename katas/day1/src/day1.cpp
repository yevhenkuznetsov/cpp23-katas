#include "day1.hpp"

#include <ranges>

auto evens_squared(const std::vector<int>& in) -> std::vector<int>
{
    return in | std::views::filter([](int x) { return x % 2 == 0; }) | std::views::transform([](int x) { return x * x; }) |
           std::ranges::to<std::vector>();
}
