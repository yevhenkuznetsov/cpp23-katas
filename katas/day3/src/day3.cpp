#include "day3.hpp"

auto parse_int(std::string_view sv) -> ParseResult
{
    if (sv.empty())
        return ParseError::Empty;
    int value = 0;
    for (char c : sv) {
        if (c < '0' || c > '9')
            return ParseError::NonNumeric;
        value = value * 10 + (c - '0');
    }
    return value;
}

auto lookup(const std::vector<int>& v, const std::size_t& idx) -> std::optional<int>
{
    if (idx >= v.size())
        return std::nullopt;
    return v[idx];
}

auto error_to_string(const ParseError& e) -> std::string_view
{
    switch (e) {
        case ParseError::Empty:
            return "empty";
        case ParseError::NonNumeric:
            return "non-numeric";
        default:
            return "unknown";
    }
}

auto visit_to_string(const ParseResult& r) -> std::string
{
    return std::visit(
        [](auto&& arg) -> std::string {
            using T = std::decay_t<decltype(arg)>;
            if constexpr (std::is_same_v<T, int>)
                return "value " + std::to_string(arg);
            else
                return std::string("error ") + std::string(error_to_string(arg));
        },
        r);
}
