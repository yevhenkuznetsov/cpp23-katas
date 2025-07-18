#include <benchmark/benchmark.h>

#include "day3.hpp"

static std::vector<int> v(1000, 1);

static void optional_lookup(benchmark::State& state)
{
    for (auto _ : state)
        benchmark::DoNotOptimize(lookup(v, static_cast<std::size_t>(state.range(0))));
}

BENCHMARK(optional_lookup)->ArgName("hit")->Arg(10)->Arg(999);
BENCHMARK(optional_lookup)->ArgName("miss")->Arg(-1)->Arg(static_cast<int64_t>(v.size()));

BENCHMARK_MAIN();
