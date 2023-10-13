#include "chu_init.h"

class BlinkLed{
	enum{
		LED_REG0 = 0,
		LED_REG1 = 1,
		LED_REG2 = 2,
		LED_REG3 = 3
	};

public:
	BlinkLed(uint32_t core_base_addr);
	~BlinkLed();

	void write_led0(uint32_t i);
	void write_led1(uint32_t i);
	void write_led2(uint32_t i);
	void write_led3(uint32_t i);
private:
	uint32_t base_addr;
	uint32_t wr_data;
};
