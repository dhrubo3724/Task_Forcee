import 'package:flutter/material.dart';

import '../widgets/addition_field widget.dart';

class DeviceSelector extends StatefulWidget {
  const DeviceSelector({super.key});

  @override
  _DeviceSelectorState createState() => _DeviceSelectorState();
}

class _DeviceSelectorState extends State<DeviceSelector> {
  String? selectedDevice;

  final List<String> devices = ['Device 1', 'Device 2', 'Device 3'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AdditionalDetails(
            onDone: () {
              Navigator.pop(context);
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: selectedDevice,
                isDense: true,

                // remove default icon to place custom arrow
                icon: const SizedBox.shrink(),
                // custom hint when nothing selected
                hint: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.qr_code,
                        size: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Select your device",
                      style: TextStyle(color: Colors.black87),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  ],
                ),
                // custom selected display
                selectedItemBuilder: (BuildContext context) {
                  return devices.map((device) {
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Icon(
                            Icons.qr_code,
                            size: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          device,
                          style: const TextStyle(color: Colors.black87),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black87,
                        ),
                      ],
                    );
                  }).toList();
                },
                dropdownColor: Colors.white,
                items:
                    devices.map((device) {
                      return DropdownMenuItem<String>(
                        value: device,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.devices,
                                color: Colors.black54,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                device,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDevice = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
