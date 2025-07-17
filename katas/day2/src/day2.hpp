#include <tuple>
#include <utility>

template <typename T1, typename T2>
auto swap_pairs(std::pair<T1, T2> p)
{
    auto [a, b] = p;
    return std::make_pair(b, a);
}

template <typename... Ts>
constexpr auto sum_tuple(const std::tuple<Ts...>& t)
{
    return std::apply([](auto... xs) { return (xs + ...); }, t);
}
