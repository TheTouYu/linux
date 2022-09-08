echo '''
 index: 20
        driver: <protocol-native.c>
        flags:
        state: RUNNING
        sink: 0 <alsa_output.pci-0000_00_1f.3.analog-stereo>
        volume: front-left: 45850 /  70% / -9.31 dB,   front-right: 45850 /  70% / -9.31 dB
                balance 0.00
        muted: no
        current latency: 19.95 ms
        requested latency: 11.61 ms
        sample spec: s16le 2ch 44100Hz
        channel map: front-left,front-right
                     Stereo
        resample method: (null)
        module: 8
        client: 143 <ffplay>
        properties:
                media.name = "Audio Stream"
                application.name = "ffplay"
                native-protocol.peer = "UNIX socket client"
                native-protocol.version = "35"
                application.process.id = "118642"
                application.process.user = "h"
                application.process.host = "TouYu"
                application.process.binary = "ffplay"
                application.language = "C"
                window.x11.display = ":0"
                application.process.machine_id = "ea0953c216fc4f34bc609105c11c3206"
                application.process.session_id = "3"
                module-stream-restore.id = "sink-input-by-application-name:ffplay"'''|awk '''
		BEGIN {
			print "hi,BEGIN"
		}
		{
			if(NR==2)
				print $2
		}
		'''
