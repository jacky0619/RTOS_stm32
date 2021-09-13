################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ThirdParty/SEGGER/Rec/segger_uart.c 

OBJS += \
./ThirdParty/SEGGER/Rec/segger_uart.o 

C_DEPS += \
./ThirdParty/SEGGER/Rec/segger_uart.d 


# Each subdirectory must supply rules for building sources it contributes
ThirdParty/SEGGER/Rec/segger_uart.o: ../ThirdParty/SEGGER/Rec/segger_uart.c ThirdParty/SEGGER/Rec/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I"C:/STM32/RTOS/RTOS_workspace/001Tasks/ThirdParty/SEGGER/Config" -I"C:/STM32/RTOS/RTOS_workspace/001Tasks/ThirdParty/SEGGER/OS" -I"C:/STM32/RTOS/RTOS_workspace/001Tasks/ThirdParty/SEGGER/SEGGER" -I"C:/STM32/RTOS/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS" -I"C:/STM32/RTOS/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/include" -I"C:/STM32/RTOS/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"ThirdParty/SEGGER/Rec/segger_uart.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
