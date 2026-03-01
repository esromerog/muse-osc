# muse-osc
Connect Muse Headband to OSC-compatible software

Connects your [Muse Headband](https://choosemuse.com/) to neurofeedback systems that accept OSC, like [Neuromore Studio](https://www.neuromore.com/products).

*No Muse Mobile App, other Mobile Apps or OSC interfaces are required*

## Quick Start (Production)

Download `setup.sh` and `start.sh` from the [latest release](../../releases/latest).

```bash
# Run once to install dependencies
bash setup.sh

# Run every session
bash start.sh
```

`start.sh` accepts optional arguments:
```bash
bash start.sh --host 192.168.1.10 --port 4545
```

## Manual Setup

0. Install Python dependencies:
```bash
pip install -r requirements.txt
```

Install [`muselsl`](https://github.com/alexandrebarachant/muse-lsl) to connect to the Muse headband via Bluetooth (required):
```bash
pip install muselsl
```

1. Start the Muse LSL stream (can also use [BlueMuse](https://github.com/kowalej/BlueMuse) or [MuseLSL2](https://github.com/DominiqueMakowski/MuseLSL2)):
```bash
muselsl stream
```

2. In a second terminal, start the OSC bridge:
```bash
python -m muse_osc
```



### OSC channels

The channels generally follow the excellent [Mind Monitor's Spec](https://mind-monitor.com/FAQ.php#oscspec).

##### Note: This module only covers the basics of this spec, as Mind Monitor is an advanced project, doing a lot of processing to the EEG data to mathematically identiify Jaw Clenches, Eye Blinks and other events.

The supported channels:

`EEG`

```bash
# Raw EEG - 256Hz
/muse/eeg # <-- tuple of 5
## Breakout per electrode
/muse/eeg/tp9
/muse/eeg/af7
/muse/eeg/af8
/muse/eeg/tp10
/muse/eeg/aux

# Bands - 10Hz
## Average value of all electrodes
/muse/elements/delta_absolute
/muse/elements/theta_absolute
/muse/elements/alpha_absolute
/muse/elements/beta_absolute
```

Currently, the `PPG`, `GYRO`, `ACC` LSL streams are not tested, yet theoretically follow the same spec.

### Options

```
--host HOST, -H HOST        OSC destination host (default: 127.0.0.1)
--port PORT, -p PORT        OSC destination port (default: 4545)
--timeout TIMEOUT           Seconds before auto-stop (default: 3600)
--lsl-streams EEG ACC PPG GYRO
                            LSL streams to forward (default: EEG)
```

## Credits

This work is heavily based on these projects:

* https://github.com/ViacheslavBobrov/LSL_Neuromore
This project was used as baseline code. It implements the basics of LSL to OSC streaming.

* https://github.com/alexandrebarachant/muse-lsl
The [`neurofeedback.py`](https://github.com/alexandrebarachant/muse-lsl/blob/master/examples/neurofeedback.py) example of this project has been used, to calculate bands and protocols with `numpy`. The [`utils.py`](https://github.com/alexandrebarachant/muse-lsl/blob/master/examples/utils.py) file has been used verbatim.