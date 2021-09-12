Microcontroller and Embedded Driver 
===========================

### :memo: About this project.
- The board which I use in this course
    * **STM32F407VG DISC1**.
![](https://i.imgur.com/hykQJ26.png)
- **IDE**
    * STM32CUBEIDE
    [IDE link](https://www.st.com/en/development-tools/stm32cubeide.html) 
## Documents 
- **Microcontroller**
    * [reference manual](https://www.st.com/resource/en/reference_manual/dm00031020-stm32f405-415-stm32f407-417-stm32f427-437-and-stm32f429-439-advanced-arm-based-32-bit-mcus-stmicroelectronics.pdf)  
        * Memory map  
        ![](https://i.imgur.com/kHr8ysH.png)  
        * RCC registers  
        ![](https://i.imgur.com/ucI09eJ.png)  
    * [data sheet](https://www.st.com/resource/en/datasheet/dm00037051.pdf) 
        * block diagram  
        ![](https://i.imgur.com/YoE4rib.png)  
        * Memory mapping  
        ![](https://i.imgur.com/AUvGqyi.png)  
        * Alternate function mapping  
        ![](https://i.imgur.com/BatF41p.png)  

- **Discovery board**
    * [board brief](https://www.st.com/resource/en/data_brief/stm32f4discovery.pdf)
    * [user manual](https://www.st.com/resource/en/user_manual/dm00039084-discovery-kit-with-stm32f407vg-mcu-stmicroelectronics.pdf)
## Online course
[Udemy link](https://www.udemy.com/course/mastering-rtos-hands-on-with-freertos-arduino-and-stm32fx/)

## What I learned in this tutorial
|# | Features                 |link                           |
|--|:-------------------------|:-----------------------------------|
|1 | Real Time Operation Sys  |[RTOS](#RTOS)               |
|1 | FreeRTOS                 |[FreeRTOS](#FreeRTOS)               |
|2 | Task Priorities          |[Priorities](#Task_Priorities)      |
|3 | Scheduler                |[Scheduler](#Scheduler)             |
|4 | Segger Systemview        |[Segger](#Segger_Systemview)        |
|5 | Context Switch           |[Context Switch ](#Context_Switch ) |
|6 | Task states              |[Task states](#Task_states)         |
|7 | FreeRTOS Notifications   |[Notify](#FreeRTOS_Notifications)   |
|8 | Interrupt APIs           |[Interrupt](#Interrupt_APIs )       |
|9 | Queue management         |[Queue](#Queue_management)          |


## RTOS
*  What is Real Time Applications?
    * The **myth** is the Real time computing is equivalent to fast computing, but the truth is the Real time computing is equivalent to **predictable computing**.
    * Real time system is defined as a system in which job has **deadline**, job has to finished by the deadline. If a result is delayed, huge loss may happen.  
    * If the **time constraints are not met**, **system failure** is said to have occurred."
* **Soft real time** requirements are those that state time deadline, but **breaching the deadline would not render the system useless**.
    * Voice over internet
    * Computer games
* In **hard real time system**, timeliness and response time is always strict and the deviation in the response time can cause chaos
    * Air Traffic Control
    * Medical System 
* **RTOS vs GPOS**
![](https://i.imgur.com/kUWFga4.png)
[image reference](https://www.udemy.com/course/mastering-rtos-hands-on-with-freertos-arduino-and-stm32fx/)
## FreeRTOS


## Task_Priorities


## Scheduler


## Segger_Systemview


## Context_Switch


## Task_states


## FreeRTOS_Notifications


## Interrupt_APIs


## Queue_management