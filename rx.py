import adi
import numpy as np

sdr = adi.ad9361('local:')


sdr.sample_rate = int(2.4e6)  # Hz
sdr.rx_lo = int(1e9)  # Hz
sdr.tx_lo = int(1e9)  # Hz
sdr.gain_control_mode = "slow_attack"
sdr.rx_buffer_size = 16 * 1024
sdr.dds_enabled = [1, 1, 1, 1]
sdr.dds_frequencies = [1e6, 1e6, 1e6, 1e6]
sdr.dds_scales = [1, 1, 0, 0]

while True:
	print(sdr.rx())
