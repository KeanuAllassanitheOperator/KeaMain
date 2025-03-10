#Skript um mit Volaitiity Memory Image Forensic Tool den Mutextypen eines Prozesses zu extrahieren
import subprocess

# Run the Volatility command and capture the output using Popen
process = subprocess.Popen(
    ['python3', 'vol.py', '-f', '/Scenarios/Investigations/Investigation-2.raw', 'windows.handles'],
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE
)

# Read the output and decode it from bytes to string
stdout, stderr = process.communicate()
stdout_text = stdout.decode('utf-8')

# Filter lines related to PID 1940 and Mutex handles
mutex_handles = [line for line in stdout_text.splitlines() if '1940' in line and 'Mutex' in line]

# Print the mutex handles
for handle in mutex_handles:
    print(handle)
