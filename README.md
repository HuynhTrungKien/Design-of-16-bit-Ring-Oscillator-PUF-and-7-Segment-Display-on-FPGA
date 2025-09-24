# Design of 16-bit Ring Oscillator PUF and 7-Segment Display on FPGA
---
## Abstract
This project focuses on the design and implementation of a Ring Oscillator Physical Unclonable Function (RO PUF) on FPGA hardware, with the output displayed on a seven-segment LED display. By exploiting the inherent randomness and process variations of each FPGA board, the system generates unique bitstreams derived from frequency differences between multiple ring oscillators (ranging from a few hertz to several tens of hertz). These bitstreams can then be stored in non-volatile memory for potential applications such as device authentication or data encryption. As this work represents an initial prototype, the design has not yet been optimized in terms of hardware resource utilization and processing speed.
## Schematic
<img width="301" height="167" alt="image" src="https://github.com/user-attachments/assets/35bd29ac-b7de-4e19-8541-5e04927c9556" />

The block diagram of the Ring Oscillator PUF (RO_PUF) consists of multiple ring oscillator blocks, the number of which depends on the design requirements. The outputs of these ring oscillators are connected to a multiplexer (MUX), which selects the input for the counter. The selection signal, referred to as the challenge (8-bit), is a bit sequence initially defined by the programmer. Even a one-bit difference in the challenge can significantly impact the output response.

To generate a single output bit, at least two counters are required. Their outputs are compared through an arbiter. If the counter associated with MUX A reaches the threshold first, the output is set to logic 1; otherwise, it is set to logic 0. By concatenating multiple such units, a longer and more reliable bitstream can be produced.
## Implement
<img width="182" height="590" alt="image" src="https://github.com/user-attachments/assets/a6711da8-ab5e-4458-9755-fa8faa0281c8" />

After run RTL Analysis in Vivado we get this schemtatic. Then I generated bitstream and uploaded to boards. To clearly demonstrate the uniqueness of the design, the same HDL source code was implemented on two different FPGA boards: Basys-3 and EBAZ4205. Both boards were tested under identical conditions, using the same source code and the same challenge input sequence. The experimental results from the two platforms are compared to highlight the variations in the output bitstreams caused by inherent hardware differences. All related result images are presented in the following section.

<img width="2560" height="1151" alt="image" src="https://github.com/user-attachments/assets/6106c9c4-e954-4b6b-9f53-cc6ae54e6dd1" />

With challenge: 00000000

<img width="2560" height="1151" alt="image" src="https://github.com/user-attachments/assets/53d2ecfe-889c-4547-9764-491cdca12c97" />

With challenge: 00000010

---

## Video demo

https://www.youtube.com/watch?v=TkfwOgIiEaU

## Reference

(https://ietresearch.onlinelibrary.wiley.com/doi/pdfdirect/10.1049/el.2019.0451)

https://github.com/Justin5567/Ring-Oscillator-PUF
