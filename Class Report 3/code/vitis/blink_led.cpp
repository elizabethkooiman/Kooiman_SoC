#include "blink_led.h"


BlinkLed::BlinkLed(uint32_t core_base_addr){

}
BlinkLed::~BlinkLed(){}

void BlinkLed::write_led0(uint32_t i){
	wr_data= i;
	io_write(base_addr,LED_REG0,wr_data);
}
void BlinkLed::write_led1(uint32_t i){
	wr_data= i;
	io_write(base_addr,LED_REG1,wr_data);
}
void BlinkLed::write_led2(uint32_t i){
	wr_data= i;
	io_write(base_addr,LED_REG2,wr_data);
}
void BlinkLed::write_led3(uint32_t i){
	wr_data= i;
	io_write(base_addr,LED_REG3,wr_data);
}
