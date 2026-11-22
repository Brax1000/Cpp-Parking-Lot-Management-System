#pragma once
#include <cstdint>
#include <string>
namespace parking {
struct Rate { std::int64_t initialCents; std::int64_t additionalCents; };
class FeeCalculator {
public:
 static std::int64_t fee(const std::string& type, std::int64_t elapsedSeconds, Rate rate);
};
}
