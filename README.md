# Modern C++23 Katas with Bazel & Clang‑18   ![CI](https://github.com/yevhenkuznetsov/cpp23-katas/actions/workflows/ci.yml/badge.svg)

Daily exercises that (should) sharpen **C++23** fluency while keeping tooling fully reproducible.  
Toolchain: Clang 18, Bazel 8, GTest 1.17
Dev environment: VS Code devcontainer (Ubuntu 24)

---

## Quick start

```bash
# 1. Clone
git clone https://github.com/yevhenkuznetsov/cpp23-katas.git

# 2. Open in VS Code (Install Dev Containers extension if necessary and reopen workspace in container)
code cpp23-katas

# 3. Build & run all tests
bazel test //...
```

## Kata Index

| ID  | Theme / Title | C++23 Feature(s) | Folder | Status |
|:-:|-|-|-|:-:|
| 01 | Even‑Number Squares (Ranges intro)  | `std::views::filter`, `std::views::transform`, `std::ranges::to` | [`katas/day1`](katas/day1) | ✅ |
| 02 | Structured Bindings & Tuples        | structured bindings, `std::tie`, `std::apply`   | [`katas/day2`](katas/day2) | ✅ |
| 03 | Optionals & Variants                | `std::optional`, `std::variant`, `std::visit`   | [`katas/day3`](katas/day3) | ✅ |
| 04 | Concepts & Type Constraints         | `concept`, `requires`, SFINAE replacement       | [`katas/day4`](katas/day4) | ⏳ |
| 05 | Ranges - Lazy CSV Parser            | `std::views::split`, `std::views::transform`    | [`katas/day5`](katas/day5) | ⏳ |
| 06 | Coroutines ‑ Generator Pattern      | `std::generator`, `co_yield`                    | [`katas/day6`](katas/day6) | ⏳ |
| 07 | `std::jthread` & Stop Token         | cooperative cancelation, RAII threads           | [`katas/day7`](katas/day7) | ⏳ |
| 08 | Lock‑Free Ring Buffer               | `std::atomic`, memory orderings                 | [`katas/day8`](katas/day8) | ⏳ |
| 09 | Compile‑Time Matrix Multiply        | `constexpr`, `std::span`, templates             | [`katas/day9`](katas/day9) | ⏳ |
| 10 | `std::format` & Custom Formatters   | `std::formatter`, user‑defined types            | [`katas/day10`](katas/day10) | ⏳ |
| 11 | Modules ‑ Hello World               | C++20 modules, `export module`                  | [`katas/day11`](katas/day11) | ⏳ |
| 12 | Parallel Algorithms Showcase        | `std::execution::par`, transform‑reduce         | [`katas/day12`](katas/day12) | ⏳ |
| 13 | `std::latch` & `std::barrier`       | thread syncronisation primitives                | [`katas/day13`](katas/day13) | ⏳ |
| 14 | SIMD with `std::experimental::simd` | C++23 parallel types (where available)          | [`katas/day14`](katas/day14) | ⏳ |
| 15 | Polymorphic Allocators              | `std::pmr::vector`, memory‑resource tuning      | [`katas/day15`](katas/day15) | ⏳ |
| 16 | Ranges ‑ Rolling Median Pipeline    | `std::views::slide`, custom view adaptor        | [`katas/day16`](katas/day16) | ⏳ |
| 17 | `std::expected` Error Handling      | Monadic error transport (C++23 TR)              | [`katas/day17`](katas/day17) | ⏳ |
| 18 | Compile‑Time JSON Parsing           | `constexpr`, template recursion                 | [`katas/day18`](katas/day18) | ⏳ |
| 19 | Basic Reflection (if enabled)       | C++23 static reflection TS preview              | [`katas/day19`](katas/day19) | ⏳ |
| 20 | End‑to‑End Micro‑Benchmark Suite    | Google Benchmark, `<chrono>` high‑res timing    | [`katas/day20`](katas/day20) | ⏳ |
