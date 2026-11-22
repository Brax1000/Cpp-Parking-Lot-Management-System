#include "fee_calculator.h"
#include <algorithm>
#include <stdexcept>
namespace parking {
std::int64_t FeeCalculator::fee(const std::string&, std::int64_t seconds, Rate rate) {
 if (seconds < 0 || rate.initialCents < 0 || rate.additionalCents < 0) throw std::invalid_argument("Duration and rates must be non-negative");
 const std::int64_t hours = std::max<std::int64_t>(1, (seconds + 3599) / 3600);
 return rate.initialCents + (hours - 1) * rate.additionalCents;
}
}
