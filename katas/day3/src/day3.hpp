#pragma once

#include <optional>
#include <string_view>
#include <variant>
#include <vector>

enum class ParseError { None, Empty, NonNumeric };

using ParseResult = std::variant<int, ParseError>;

auto parse_int(std::string_view sv) -> ParseResult;

auto lookup(const std::vector<int>& v, const std::size_t& idx) -> std::optional<int>;

auto error_to_string(const ParseError& e) -> std::string_view;

auto visit_to_string(const ParseResult& r) -> std::string;
