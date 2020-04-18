SECBOOT版本更新：
secboot_v3.13:
   1）UART0/UART1都可用于secboot与上位机的通信口
   2）修改固件启动时针对image头的处理逻辑，防止固件被破坏

secboot_v3.14:
   1）仅UART1可用于secboot与上位机的通信口。
   2）修改固件启动时针对image头的处理逻辑，防止固件被破坏

增加2M Flash的后面1M的擦除指令：21 06 00 9f 6f 48 00 00 00