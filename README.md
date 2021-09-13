Real Time Operation System with STM32F4
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
    * [data sheet](https://www.st.com/resource/en/datasheet/dm00037051.pdf) 

- **Discovery board**
    * [board brief](https://www.st.com/resource/en/data_brief/stm32f4discovery.pdf)
    * [user manual](https://www.st.com/resource/en/user_manual/dm00039084-discovery-kit-with-stm32f407vg-mcu-stmicroelectronics.pdf)
## Online course
[Udemy link](https://www.udemy.com/course/mastering-rtos-hands-on-with-freertos-arduino-and-stm32fx/)

## What I learned in this tutorial
|#  | Features                 |link                                |
|---|:-------------------------|:-----------------------------------|
|1  | Real Time Operation Sys  |[RTOS](#RTOS)                       |
|2  | FreeRTOS                 |[FreeRTOS](#FreeRTOS)               |
|3  | Task Priorities          |[Priorities](#Task_Priorities)      |
|4  | Scheduler                |[Scheduler](#Scheduler)             |
|5  | Exercise 1               |[Ex1](#Exercise_1)                  |
|6  | Segger Systemview        |[Segger](#Segger_Systemview)        |
|7  | Exercise 2               |[Ex2](#Exercise_2)                  |
|8  | Context Switch           |[Context Switch ](#Context_Switch ) |
|9  | Task states              |[Task states](#Task_states)         |
|10 | Task delay APIs          |[delay](#Task_delay_APIs)           |
|11 | FreeRTOS Notifications   |[Notify](#FreeRTOS_Notifications)   |
|12 | Hook functions           |[Hook](#Hook_functions )            |
|13 | Queue management         |[Queue](#Queue_management)          |
|14 | Exercise 3               |[Ex3](#Exercise_3)                  |


## RTOS
*  What is Real Time Applications?
    * The **myth** is the Real time computing is equivalent to fast computing, but the truth is the Real time computing is equivalent to **predictable computing**.
    * A breal application is **time deterministic**. That means, it's **response time to events is almost constant**.
    * Real time system is defined as a system in which job has **deadline**, job has to finished by the deadline. If a result is delayed, huge loss may happen.  
    * If the **time constraints are not met**, **system failure** is said to have occurred."
* **Soft real time** requirements are those that state time deadline, but **breaching the deadline would not render the system useless**.
    * Voice over internet
    * Computer games
* In **hard real time system**, timeliness and response time is always strict and the deviation in the response time can cause chaos.
    * Air Traffic Control
    * Medical System 
* **RTOS vs GPOS**
* In **GPOS**, task scheduling is not always based on which application or process has priority. They typically use a **“fairness” policy** to dispatch threads and processes. 
* In **RTOS** scheduling is always **priority-based**. Most of them use **preemptive scheduling** which is based on priority level.
![](https://i.imgur.com/kUWFga4.png)
[image source](https://www.udemy.com/course/mastering-rtos-hands-on-with-freertos-arduino-and-stm32fx/)
## FreeRTOS
* FreeRTOS is a **class of RTOS** that is designed to be **small enough to run on a microcontroller** - although its use is not limited to microcontroller applications.
* FreeRTOS provides the **core real time scheduling functionality**, inter-task communication, timing and synchronisation primitives and so on. This means it is more accurately described as a real time kernel, or real time executive.
![](https://i.imgur.com/7pXe20V.png)
[FreeRTOS link](https://www.freertos.org/index.html)
* **Task creation and implementation**
    * The function of xTaskCreate()
    ![](https://i.imgur.com/PgMJb8o.png)
[image source](https://www.udemy.com/course/mastering-rtos-hands-on-with-freertos-arduino-and-stm32fx/)
    * A task will normally be **implemented as an infinite loop**. And inside the infinite loop, you have to implement the code for the task functionality.
    * Should the task implementation ever break out of the above loop, then the task **must be deleted** before reaching the end of this function.
    ![](https://i.imgur.com/HDvSijP.png)
    [image source](https://www.udemy.com/course/mastering-rtos-hands-on-with-freertos-arduino-and-stm32fx/)





## Task_Priorities
* A priority value comes into the picture when there are **two or more tasks** in the system, what we call it as　a **multitask system**.
* A priority value helps the **scheduler** to decide which task should **run first on the processor**.
* In **FreeRTOS** each task can be assigned a priority value from **0 to configMAX_PRIORITIES -1.**
* So, we must decide **configMAX_PRIORITIES** as per our application need.
* **Please note that**, using a **too many task priority values** could lead to **RAM's overconsumption**.
* This is because that actually increase number of **contact switches** happening in the system and context switch comes with its own **overhead of time and space**.

## Scheduler
* Scheduler is a **piece of code** that is part of the **FreeRTOS kernel**, which runs in the **privileged mode** of the processor.
* There are two scheduling policies, **preemptive and cooperative**.
* There are mainly two types in **preemptive scheduling**.

    * One is **Round robin pre-emptive scheduling** or you can also call it as **Cyclic pre-emptive scheduling**.
    * Another one is **Priority based pre-emptive scheduling**.
![](https://i.imgur.com/WPOEuPt.png)  
* **Round robin pre-emptive scheduling**  
![](https://i.imgur.com/5XcoJNa.png)  
[image source](https://www.udemy.com/course/mastering-rtos-hands-on-with-freertos-arduino-and-stm32fx/)  
* **Priority based pre-emptive scheduling**  
![](https://i.imgur.com/Oyrr2no.png)
[image source](https://www.udemy.com/course/mastering-rtos-hands-on-with-freertos-arduino-and-stm32fx/)  
* **Cooperative based scheduling**
![](https://i.imgur.com/U2lBjDq.png)
[image source](https://www.udemy.com/course/mastering-rtos-hands-on-with-freertos-arduino-and-stm32fx/)  

## Exercise_1
* First, let's create two tasks.
``` c =
  status = xTaskCreate(task1_handler, "Task-1", 200, "Hello world from Task-1", 2, &task1_handle);

  configASSERT(status == pdPASS);

  status = xTaskCreate(task2_handler, "Task-2", 200, "Hello world from Task-2", 2, &task2_handle);

  configASSERT(status == pdPASS);
```
* Second, implement the tasks handlers.
```C = 
static void task1_handler(void* parameters){
	while(1)
	{
		printf("%s/n",(char*) parameters);
	}

}

static void task2_handler(void* parameters){
	while(1)
	{
		printf("%s/n",(char*) parameters);
	}

}
```
* Third, activate FreeRTOS scheduler.
``` C =
  //start the freeRTOS scheduler
  vTaskStartScheduler();
```
![](https://i.imgur.com/1egbsyp.png)
* Then we can use **SWV ITM data console** to see the printf messages.
![](https://i.imgur.com/IGU4Ixc.png)
    * This output looks gibberish, it is because the **interrupt** from the **systick timer** launches the scheduler to preempt the task.
    * In this application, the **configUSE_PREEMPTION** macro is **set to 1**. That means, the kernel is **pre-emptive kernel**.

* If you want to solve this problem, then you can make Task 1 to **lock this resource** and not to release this resource **until it finishes writing all of its data** to this resource. 
![](https://i.imgur.com/eqECFor.png)
* Then we can see that only Task 1 is running. Because, we have turned off the kernel pre-emption to cooperative mode.
![](https://i.imgur.com/S44MQPX.png)
* When the Task **finishes sending its message**, we can **give　up the processor**. To give up the processor, you can use **taskYIELD function**　given by the FreeRTOS kernel, **taskYIELD()**.
![](https://i.imgur.com/mUtXV1q.png)
* Then the output is neat now.
![](https://i.imgur.com/kaIy7b7.png)


## Segger_Systemview
[segger.com](https://www.segger.com/)
* We can download segger systemview software here.
![](https://i.imgur.com/5rwYVE0.png)
* **SystemView** is a software toolkit produced by SEGGER, which is used to **analyze the embedded software behaviour**.
* We can analyze **how many tasks are running** and how much **duration they are consuming on the CPU**.
* We can also analyze other **behaviour of the tasks**, such as the task is **blocking, unblocking, notifying, yielding**, etc.
* Also, we can can analyze **CPU idle time** and **total runtime behaviour** of the application.
---
* There are **two visualization modes** in Segger Systemview.
* One is called as **Real time recording** or that is also called as continuous recording. And the second one is **Single-shot recording**. 
* We can trace various events with **runtime window, cpu load window, time line window** ,etc as the following image.
![](https://i.imgur.com/2uFbLCu.png)






## Context_Switch
* The **context switching** is a process of **switching out of one task** and **switching in another task** on　the CPU to execute．
* In **FreeRTOS** Context Switching is taken care by the **PendSV Handler found in port.c**. 
* If the scheduler is **priority based pre-emptive scheduler**, then for every RTOS tick interrupt, the scheduler will **compare the priority** of the running task with the priority of **ready tasks list**.
* We can see what the function actually does in **taskYIELD()**, which we used in the prior exercise.
![](https://i.imgur.com/lgmLPXD.png)
* **Context switching procedure.**
![](https://i.imgur.com/M2GqwnT.png)
[image source](https://www.freertos.org/RTOS-task-states.html)

## Task_states
* This is the **state of the task**.
![](https://i.imgur.com/TVeTJKZ.png)
* Task actually uses **PSP** in order to track the **individual stack utilization**, whereas kernel uses　**MSP** in order to track **kernel's stack utilization**.
* In short, **PSP is for user task** and **MSP is for kernel**.
![](https://i.imgur.com/cg3f7dS.png)
* **Running**: When a task is actually **executing** it is said to be in the Running state.
* **Ready**: Ready tasks are those that are **able to Execute**, but are not since **another task has been in the running state**.
* **Blocking**: A task is said to be in the Blocked state if it is currently **waiting for either a temporal or external Event** i.e. Time Delay or Synchronization Events.
![](https://i.imgur.com/3y9SL8G.png)
[image source](https://miro.medium.com/max/1116/1*l6PiEJyENXK46fHnwoQcDg.png)
## Task_delay_APIs
* We use this APIs fortwo important use cases.
    * Delay a task **without engaging the processor**.
    * Implement **periodic tasks**.
* There are three different types of tasks.
    * **Continuous task**      
    * **Periodic task**
        * The periodic task are those tasks which execute on the CPU with **fixed execution period**.
    * **Aperiodic task**
        * A task which responds to **asynchronous events** is called as Aperiodic task.
* In **task.h**
``` C=
void vTaskDelay( const TickType_t xTicksToDelay );
```
``` C=
void vTaskDelayUntil( TickType_t *pxPreviousWakeTime,
                      const TickType_t xTimeIncrement );
```
* We can see details in [FreeRTOS](https://www.freertos.org/a00127.html)
![](https://i.imgur.com/pK31rr2.png)
[image source](https://www.freertos.org/a00116.html)
![](https://i.imgur.com/1d5oIfv.png)
[image source](https://www.freertos.org/a00116.html)
* Conclusion
    * If you want to implement **delay inside your task function**,use **vTaskDelay()** instead of crude for loop or while loop-based delay.
    *  If you want to implement a task that must execute with a **fixed execution period**, then use **vTaskDelayUntil**.


## FreeRTOS_Notifications
* An **RTOS task notification** is an event sent directly to a task that can **unblock the receiving task**, and optionally update the receiving task's notification value in a number of different ways.
* The notification is nothing but just an **event or command** which you **send from Task-A to Task-B**.
* While sending notification, you can also **send a value along with that**.
* **xTaskNotify()**
    * xTaskNotify() is used to **send an event directly** to and potentially unblock an RTOS task.
    * function prototype
``` C=
BaseType_t xTaskNotify( TaskHandle_t xTaskToNotify,
                        uint32_t ulValue,
                        eNotifyAction eAction );

BaseType_t xTaskNotifyIndexed( TaskHandle_t xTaskToNotify, 
                               UBaseType_t uxIndexToNotify, 
                               uint32_t ulValue, 
                               eNotifyAction eAction );
```
* **xTaskNotifyWait()**
    * It **waits** with an optional timeout **until it receives a notification** from othre tasks.
    * Ｉt will **never consume CPU cycles** if it is waiting. So, waiting means, it is actually **blocked**.
    * function prototype
``` C=
BaseType_t xTaskNotifyWait( uint32_t ulBitsToClearOnEntry,
                            uint32_t ulBitsToClearOnExit,
                            uint32_t *pulNotificationValue,
                            TickType_t xTicksToWait );

BaseType_t xTaskNotifyWaitIndexed( UBaseType_t uxIndexToWaitOn, 
                                   uint32_t ulBitsToClearOnEntry, 
                                   uint32_t ulBitsToClearOnExit, 
                                   uint32_t *pulNotificationValue, 
                                   TickType_t xTicksToWait );
```


## Hook_functions
* When there are **no tasks in the system** that all the tasks are blocked or suspended.The **Idle task** will always run on the CPU, and it can call a callback function which is implemented in your application source code, so that what we call as **hook function**.
* In the hook function we can send micro-controller to sleep mode, to save power,etc.
* There are many hook functions are available.
    * Idle task hook funtion
    * RTOS Tick hook function
    * Dynamic memory allocation failed hook function
    * Stack over flow hook function

## Queue_management
* A Queue is nothing but a **data structure** which can hold a finite number of fixed size data items.
* Queues are used as **first in first out buffers**.
![](https://i.imgur.com/ALCwnsj.png)
[image source](https://www.freertos.org/a00116.html)
    * The first argument is **uxQueueLength** that is the **maximum data item** the queue can hold.
    * Second argument is **uxItemSize** which is actually in bytes, that is number of **bytes occupied by each item** of the queue.
    * Queue then **returns** a reference to that created queue that be call as **QueueHandle**. 
* **Send** data to queue
    * If the **queue is full** then this API will immediately **return saying that queue is full**.
``` C=
BaseType_t xQueueSendToFront( QueueHandle_t xQueue,
                              const void * pvItemToQueue,
                              TickType_t xTicksToWait );
```
* **Receive** data to queue 
    * Receive an item from a queue. The item is received by copy so a buffer of adequate size must be provided.
``` C=
BaseType_t xQueueReceive( QueueHandle_t xQueue,
                          void *pvBuffer,
                          TickType_t xTicksToWait);
```
* **Receive** an item from a queue **without removing the item** from the queue.
```C=
BaseType_t xQueuePeek( QueueHandle_t xQueue,
                       void *pvBuffer,
                       TickType_t xTicksToWait);
```
## Exercise_3
*  Use **Tera Term** software to send command over **UART**.
![](https://i.imgur.com/FXEziB7.jpg)
[download link](https://zh-tw.osdn.net/projects/ttssh2/downloads/53081/teraterm-4.71.exe/)
* **Tera term settings**
    * Choose **USB serial port**
    ![](https://i.imgur.com/kvrVuIE.png)
    * Remember to check the Local echo
    ![](https://i.imgur.com/Ve8Ctbr.png)
    * Set the baud rate to 115200
    ![](https://i.imgur.com/JP6uds1.png)
* Code implementation
 
* Menu Task
``` C=
void menu_task(void *param)
{
	uint32_t cmd_addr;

	command_t *cmd;

	int option;

	const char* msg_menu = "\n========================\n"
							"|         Menu         |\n"
							"========================\n"
								"LED effect    ----> 0\n"
								"Date and time ----> 1\n"
								"Exit          ----> 2\n"
								"Enter your choice here : ";

	while(1){
		xQueueSend(q_print,&msg_menu,portMAX_DELAY);

		//wait for menu commands
		xTaskNotifyWait(0,0,&cmd_addr,portMAX_DELAY);
		cmd = (command_t*)cmd_addr;

		if(cmd->len == 1)
		{
			option = cmd->payload[0] - 48;
			switch(option)
			{
				case 0:
					curr_state = sLedEffect;
					xTaskNotify(handle_led_task,0,eNoAction);
					break;
				case 1:
					curr_state = sRtcMenu;
					xTaskNotify(handle_rtc_task,0,eNoAction);
					break;
				case 2: /*implement exit */
					break;
				default:
					xQueueSend(q_print,&msg_inv,portMAX_DELAY);
					continue;
			}

		}else{
			//invalid entry
			xQueueSend(q_print,&msg_inv,portMAX_DELAY);
			continue;
		}


		//wait to run again when some other task notifies
		xTaskNotifyWait(0,0,NULL,portMAX_DELAY);

	}//while super loop
}
```
* led task
``` C=
void led_task(void *param)
{
	uint32_t cmd_addr;
	command_t *cmd;
	const char* msg_led = "========================\n"
						  "|      LED Effect     |\n"
						  "========================\n"
						  "(none,e1,e2,e3,e4)\n"
						  "Enter your choice here : ";

	while(1){
		/*Wait for notification (Notify wait) */
		xTaskNotifyWait(0,0,NULL,portMAX_DELAY);

		/*Print LED menu */
		xQueueSend(q_print,&msg_led,portMAX_DELAY);

		/*wait for LED command (Notify wait) */
		xTaskNotifyWait(0,0,&cmd_addr,portMAX_DELAY);
		cmd = (command_t*)cmd_addr;

		if(cmd->len <= 4)
		{
			if(! strcmp((char*)cmd->payload,"none"))
				led_effect_stop();
			else if (! strcmp((char*)cmd->payload,"e1"))
				led_effect(1);
			else if (! strcmp((char*)cmd->payload,"e2"))
				led_effect(2);
			else if (! strcmp((char*)cmd->payload,"e3"))
				led_effect(3);
			else if (! strcmp((char*)cmd->payload,"e4"))
				led_effect(4);
			else
				xQueueSend(q_print,&msg_inv,portMAX_DELAY); /*print invalid message */
		}else
			xQueueSend(q_print,&msg_inv,portMAX_DELAY);

		/* update state variable */
		curr_state = sMainMenu;

		/*Notify menu task */
		xTaskNotify(handle_menu_task,0,eNoAction);

	}
}
```
* print task
``` C=
void print_task(void *param)
{

	uint32_t *msg;
	while(1){
		xQueueReceive(q_print, &msg, portMAX_DELAY);
		HAL_UART_Transmit(&huart2, (uint8_t*)msg, strlen((char*)msg),HAL_MAX_DELAY);
	}
}

```
* cmd handler task
``` C=
void cmd_handler_task(void *param)
{
	BaseType_t ret;
	command_t cmd;

	while(1){
		/*Implement notify wait */
		ret = xTaskNotifyWait(0,0,NULL,portMAX_DELAY);

		if(ret == pdTRUE){
			/*process the user data(command) stored in input data queue */
			process_command(&cmd);
		}

	}

}

```
* process command
``` C= 
void process_command(command_t *cmd)
{
	extract_command(cmd);

	switch(curr_state)
	{
		case sMainMenu:
			xTaskNotify(handle_menu_task,(uint32_t)cmd , eSetValueWithOverwrite);
		break;

		case sLedEffect:
			xTaskNotify(handle_led_task,(uint32_t)cmd , eSetValueWithOverwrite);
		break;

		case sRtcMenu:
		case sRtcTimeConfig:
		case sRtcDateConfig:
		case sRtcReport:
			xTaskNotify(handle_rtc_task,(uint32_t)cmd , eSetValueWithOverwrite);
		break;

	}

}
```
* extract command
``` C= 
int extract_command(command_t *cmd)
{
	uint8_t item;
	BaseType_t  status;

	status = uxQueueMessagesWaiting(q_data );
	if(!status) return -1;
	uint8_t i =0;

	do
	{
		status = xQueueReceive(q_data,&item,0);
		if(status == pdTRUE) cmd->payload[i++] = item;
	}while(item != '\n');

	cmd->payload[i-1] = '\0';
	cmd->len = i-1; /*save  length of the command excluding null char */

	return 0;
}

```
* Deal with the receive messages
``` C=
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
	uint8_t dummy;

	for(uint32_t i = 0 ; i < 4000 ; i++);

	if(! xQueueIsQueueFullFromISR(q_data))
	{
		/*Enqueue data byte */
		xQueueSendFromISR(q_data , (void*)&user_data , NULL);
	}else{
		if(user_data == '\n')
		{
			/*Make sure that last data byte of the queue is '\n' */
			xQueueReceiveFromISR(q_data,(void*)&dummy,NULL);
			xQueueSendFromISR(q_data ,(void*)&user_data , NULL);
		}
	}

	/*Send notification to command handling task if user_data = '\n' */
	if( user_data == '\n' ){
		/*send notification to command handling task */
		xTaskNotifyFromISR (handle_cmd_task,0,eNoAction,NULL);
	}

	/* Enable UART data byte reception again in IT mode */
	 HAL_UART_Receive_IT(&huart2, (uint8_t*)&user_data, 1);


}
```
* We can see the menu which we create in Tera term.
![](https://i.imgur.com/zNseJhc.png)

## Exercise_2
* We can test the 2 tasks application as I mentioned above with Segger Systemview.
* Because I am using STM32F407 DISC-1, I need FT232RL USB to UART TTL Serial Adapter.  
![](https://i.imgur.com/TkvXOCp.jpg)  
* Connections  
![](https://i.imgur.com/GPTAUyx.png)  
![](https://i.imgur.com/Yr4ZeZT.png)
* If you **don't have this port** you should download the driver of USB dongle.  
![](https://i.imgur.com/JIQA53g.png)
* Then run the application.  
```C=115
static void task1_handler(void* parameters)
{
  MX_GPIO_Init();
  MX_USART2_UART_Init();


  //Enable the CYCCNT counter.
  DWT_CTRL |= ( 1 << 0);

  SEGGER_UART_init(250000);//500000

  SEGGER_SYSVIEW_Conf();

  status = xTaskCreate(task1_handler, "Task-1", 200, "Hello world from Task-1", 2, &task1_handle);

  configASSERT(status == pdPASS);

  status = xTaskCreate(task2_handler, "Task-2", 200, "Hello world from Task-2", 2, &task2_handle);

  configASSERT(status == pdPASS);

  //start the freeRTOS scheduler
  vTaskStartScheduler();
	char msg[100];

	while(1)
	{
		snprintf(msg,100,"%s\n", (char*)parameters);
		SEGGER_SYSVIEW_PrintfTarget(msg);
		taskYIELD();
	}

}

static void task2_handler(void* parameters)
{
	char msg[100];
	while(1)
	{
		snprintf(msg,100,"%s\n", (char*)parameters);
		SEGGER_SYSVIEW_PrintfTarget(msg);
		taskYIELD();
	}

}
```

* We can see **Task-1 and Task-2 messages** in context window.
* And the **Systick** calls **ISR events** intermediately. 
![](https://i.imgur.com/rLP0veC.png)
* Contexts window shows that the **CPU Load is actually low** because most of the time **CPU is idle**.  
![](https://i.imgur.com/62uYf9y.png)
* In Timeline window, we can see each event with actual runtime. 
![](https://i.imgur.com/uaMXzAJ.png)

 
