#include "fee_calculator.h"
#include <cassert>
#include <stdexcept>
int main() {
 using parking::FeeCalculator; using parking::Rate;
 assert(FeeCalculator::fee("Car", 0, {4000, 2000}) == 4000);
 assert(FeeCalculator::fee("Car", 3600, {4000, 2000}) == 4000);
 assert(FeeCalculator::fee("Car", 3601, {4000, 2000}) == 6000);
 assert(FeeCalculator::fee("Car", 12600, {4000, 2000}) == 10000);
 bool rejected=false; try { FeeCalculator::fee("Car", -1, {4000,2000}); } catch(const std::invalid_argument&) { rejected=true; }
 assert(rejected);
}
