<p align="center">
  <a href="https://nilotica.github.io/"><img src="assets/logo.png" width="350" height="274"  alt="nilotica"></a>
</p>

<div align="center">

# Nilotica

ENGLISH | [中文](README.md)

_✨ A futures quantitative trading system based on vnpy ✨_

</div>

![GitHub License](https://img.shields.io/github/license/Lumosylva/Nilotica)&ensp;![Python Version from PEP 621 TOML](https://img.shields.io/python/required-version-toml?tomlFilePath=https%3A%2F%2Fraw.githubusercontent.com%2FLumosylva%2FNilotica%2Fmain%2Fpyproject.toml)&ensp;![GitHub Release](https://img.shields.io/github/v/release/Lumosylva/Nilotica)&ensp;![GitHub Release Date](https://img.shields.io/github/release-date/Lumosylva/Nilotica)&ensp;[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/Lumosylva/Nilotica)&ensp;[![QQ Group#1](https://img.shields.io/badge/QQ%20Group%231-Join-blue)](https://qun.qq.com/universal-share/share?ac=1&authKey=dzGDk%2F%2Bpy%2FwpVyR%2BTrt9%2B5cxLZrEHL793cZlFWvOXuV5I8szMnOU4Wf3ylap7Ph0&busi_data=eyJncm91cENvZGUiOiI0NDYwNDI3NzciLCJ0b2tlbiI6IlFrM0ZhZmRLd0xIaFdsZE9FWjlPcHFwSWxBRFFLY2xZbFhaTUh4K2RldisvcXlBckZ4NVIrQzVTdDNKUFpCNi8iLCJ1aW4iOiI4MjEzMDAwNzkifQ%3D%3D&data=O1Bf7_yhnvrrLsJxc3g5-p-ga6TWx6EExnG0S1kDNJTyK4sV_Nd9m4p-bkG4rhj_5TdtS5lMjVZRBv4amHyvEA&svctype=4&tempid=h5_group_info) 

<p align="center">
    <a href="https://nilotica.github.io/">Document 1</a>
    ·
    <a href="https://deepwiki.com/Lumosylva/Nilotica">Document 2</a>
    ·
    <a href="https://nilotica.github.io/guide/quick-start">Getting started quickly</a>
</p>

------

**This project is still under development, please do not use it in a real production environment. **

### **1. Introduction**

This project is based on [vnpy](https://github.com/vnpy/vnpy) and [vnpy_ctp](https://github.com/vnpy/vnpy_ctp). As an open source quantitative trading platform development framework, vnpy provides all-round support for strategy design and transaction execution with rich components and flexible architecture; vnpy_ctp is deeply connected to the domestic futures market to ensure accurate transmission of trading signals and efficient and smooth transaction execution.

The project is committed to lowering the entry threshold for domestic futures quantitative trading, helping manual traders to easily cross over to the field of quantitative trading, freeing them from the constraints of cumbersome technology, and focusing on strategy creative conception and optimization, exploring the infinite possibilities of quantitative trading, and enjoying the new experience of technology-enabled trading upgrades.

The functions currently implemented by the system are:

- Market Gateway
- Order Execution Gateway
- Strategy Engine
- Risk control management
- Data Recording
- Strategy backtesting
- Market playback

### **2. Basic Environment**

- **Python** : `3.12.9` version
- **Toolchain**: uv + hatch + setuptools
- **vnpy** : version `4.0.0`
- **vnpy_ctp**: `6.7.7.1` version (developed based on the `6.7.7` interface package of CTP futures version, the interface comes with the dll file of [penetrating real disk environment])
- If you need to compile other versions of CTP C++, you need to make sure you have installed `Visual Studio` (`Windows`), `GCC` (`Linux`) before executing the following command

- If you use the CTP version of this system directly, you do not need to perform the build process in step 4 below. You can directly download the `whl` file in the [Releases](https://github.com/Lumosylva/Nilotica/releases) package, and then install it with `uv pip install`

- **Note**: Currently all codes are only tested in Windows environment, and have not been tested under Linux

### **3. Description**

This project modified some source code files in the vnpy library and used some key third-party libraries:

* Python project management tool: uv
* Python project building tool: hatch
* Internationalization (i18n): Babel
* C++ and Python binding: pybind11
* Stub generation: pybind11-stubgen

### **4. Environment Configuration**

This project uses `uv` to manage Python virtual environments and dependent packages, and `hatch` as a build tool

- Install uv

On Windows

```bash
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

On Linux

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

- Install the specified version of Python

```bash
uv python install 3.12.9
```

- Use the `uv sync` command to let `uv` automatically create a Python virtual environment and download dependent packages according to the configuration in `pyproject.toml`

```bash
uv sync
```

Or manually create a virtual environment without using the `uv sync` command

```bash
uv venv --python 3.12.9 .venv
```

Activate the virtual environment

```bash
.venv\Scripts\activate
```

- Install ta_lib library

  On Windows

```bash
install_ta_lib.bat
```

​        On Linux

```bash
install_ta_lib.bat
```

### **5. Compile VNPY_CTP**

When `vnpy_ctp` needs to be compiled, executing the `hatch build` command will use the `hatch_build.py` build script under the project vnpy_ctp\api\ to compile the vnctpmd and vnctptd modules into .pyd files (on Windows) or .so files (on Linux), and generate the corresponding Python interface stub files (.pyi). The script uses the pybind11 library to simplify the binding process between C++ and Python, and performs the build operation through setuptools and hatchling.

When `vnpy_tts` needs to be compiled, please modify the `path` of the `[tool.hatch.build.hooks.custom]` build script in `pyproject.toml` to `hatch_build_tts.py`, and then execute `hatch build` to compile a similar process as above.

#### **(1) Clean up old builds**

Open the terminal and enter the project root directory, delete the `dist` and `build` directories

PowerShell

```bash
Remove-Item -Recurse -Force dist, build -ErrorAction SilentlyContinue
```

CMD

```bash
rmdir /s /q dist
rmdir /s /q build
```

Bash

```bash
rm -rf dist build
```

#### **(2) Execute the build**

Method 1:

```bash
build.bat
```

or

```bash
build.sh
```

Method 2:

Enter the project root directory, add the ta-lib source file directory to the temporary environment variable (set it to your actual path), and then execute hatch build

```bash
set TA_INCLUDE_PATH=D:\Project\PycharmProjects\Nilotica_dev\ta-lib\include
set TA_LIBRARY_PATH=D:\Project\PycharmProjects\Nilotica_dev\ta-lib\lib
```

or

```bash
export TA_INCLUDE_PATH="$PATH:/ta-lib/include"
export TA_LIBRARY_PATH="$PATH:/ta-lib/lib"
```

```bash
hatch build
```

The build effect is as follows:

<img src="assets/hatch_build1.png" style="zoom:67%;" />

<img src="assets/hatch_build2.png" style="zoom:67%;" />

### **6. Project Structure**

```reStructuredText
.
├── assets - Image resource files
├── bat - Windows BAT service startup script
│ ├── 1_run_market_gateway.bat - market gateway startup script
│ ├── 2_run_order_gateway.bat - order execution gateway startup script
│ ├── 3_run_strategy_engine.bat - strategy engine startup script
│ ├── 4_run_risk_manager.bat - risk control management startup script
│ ├── 5_run_data_recorder.bat - data recording startup script
│ └── 6_run_backtest.bat - strategy backtesting demo script
├── config - project configuration directory
│ ├── constants - constant directory
│ │ ├── params.py - constants
│ │ └── path.py - path constants
│ └── project_files - File directories for storing holidays, contract multipliers and rates, contract and exchange mapping, etc.
│ │ ├── backtest_config.yaml - Backtest parameter configuration
│ │ ├── backtest_strategies_setting.json - Backtest strategy parameter configuration
│ │ ├── dev_config.yaml - Development mode configuration
│ │ ├── global_config.yaml - Global configuration
│ │ └── prod_config.yaml - Production mode configuration
├── locales - internationalization related files
│ ├── en/LC_MESSAGES - English translation file
│ ├── compile_translations_util.py - Internationalization compilation script
│ ├── language.json - Chinese-English mapping file
│ ├── messages.pot - Internationalization related files
│ └── translate_text_fill_util.py - Script to help fill in translation text
├── ta-lib - ta-lib library source file
├── utils - Tool package, including logs, paths, etc.
│ ├── logger - Logging tool
│ ├── path - Path tool
│ ├── config_manager.py - Configuration management
│ ├── config_models.py - Contains PathsConfig, ZmqAddressesConfig, LoggingConfig, GlobalConfigStructure Pydantic models.
│ ├── converter.py - Tools for converting objects to msgpack serializable.
│ └── i18n.py - internationalization related tools
├── vnpy - vnpy's official core library, the main function is the event-driven engine.
├── vnpy_ctp - vnpy's official ctp library, the main function is to provide the underlying interface for interaction with simnow and real market quotation and trading server.
├── vnpy_tts - vnpy's official tts library, the main function is to provide the underlying interface for interaction with tts and real market quotation and trading server.
├── zmq_services - the core of the system, including market gateway, order execution gateway, strategy subscriber, risk control management, data recording, strategy backtesting, market playback.
│ ├── backtester - backtest directory
│ │ ├── data_player.py - data playback
│ │ ├── performance.py - calculate performance indicators, backtest performance report
│ │ ├── run_backtest.py - run backtest script
│ │ ├── run_data_player.py - run data playback script
│ │ └── simulation_engine.py - simulation engine
│ ├── strategies - strategy storage location
│ ├── recorded_data - accounts, tick, order, trader data local storage directory
│ ├── dev_recorded_data - development mode data storage directory
│ ├── data_recorder.py - data recorder
│ ├── market_data_gateway.py - market gateway
│ ├── order_execution_gateway.py - order execution gateway
│ ├── risk_manager.py - Risk Control Manager
│ ├── rpc_client_test.py - Order test script
│ ├── run_data_recorder.py - Data recorder startup script
│ ├── run_market_gateway.py - Market gateway startup script
│ ├── run_order_gateway.py - Order execution gateway startup script
│ ├── run_risk_manager.py - Risk Control Manager startup script
│ ├── run_strategy_engine.py - Strategy engine startup script
│ ├── strategy_base.py - Strategy base class
│ ├── zmq_base.py - Base class for managing ZMQ Context and PUB Socket
│ └── strategy_engine.py - Strategy engine
├── .python-version - Python version number used by the project, automatically generated by uv and does not need to be manually edited.
├── CHANGELOG.md - System version update log
├── CODE_OF_CONDUCT.md - Code of Conduct
├── LICENSE.txt - License file
├── README.md - Project description in Chinese
├── README_EN.md - Project description in English
├── __init__.py - Project version number
├── babel.cfg - configuration file for babel translation
├── build.bat - Windows project automatic build script
├── build.sh - Linux project automatic build script
├── hatch_build.py - The vnpy_ctp build script is responsible for compiling the C++ extension
├── hatch_build_tts.py - The vnpy_tts build script is responsible for compiling the C++ extension
├── install_ta_lib.bat - Windows installation script for ta-lib 0.6.3
├── install_ta_lib.sh - Linux installation script for ta-lib 0.6.3
├── locales.bat - script to assist internationalization
├── locales.sh - script to assist internationalization
├── main.py - Main project file, no definition for now
├── pyproject.toml - Project configuration file, automatically generated by uv, used to define the main dependencies, metadata, build system and other information of the project.
├── run.bat - Windows script, one-click start of the market gateway, order execution gateway, strategy subscriber, risk control management, data recording script
├── run.sh - Linux script, one-click start of the market gateway, order execution gateway, strategy subscriber, risk control management, data recording script
└── uv.lock - Records all dependencies of the project, automatically managed by uv, no manual editing required.
```

### **7. Service operation display**

1. Run the market gateway:

<img src="assets/01_run_market_gateway.png" style="zoom:67%;" />

2. Run the order execution gateway:

<img src="assets/02_run_order_gateway1.png" style="zoom:67%;" />

<img src="assets/03_run_order_gateway2.png" style="zoom:67%;" />

3. Run the strategy engine:

<img src="assets/04_run_strategy_engine1.png" style="zoom:67%;" />

<img src="assets/05_run_strategy_engine2.png" style="zoom:67%;" />

4. Operational risk control management:

<img src="assets/06_run_risk_manager1.png" style="zoom:67%;" />

<img src="assets/07_run_risk_manager2.png" style="zoom:67%;" />

5. Operation data recording:

<img src="assets/08_run_data_recorder.png" style="zoom:67%;" />

6. Run the backtest

<img src="assets/09_run_backtest1.png" style="zoom:67%;" />

<img src="assets/10_run_backtest2.png" style="zoom:67%;" />

<img src="assets/11_run_backtest3.png" style="zoom:67%;" />

<img src="assets/12_run_backtest4.png" style="zoom:67%;" />

<img src="assets/13_run_backtest5.png" style="zoom:67%;" />

 7. Data player

    <img src="assets/14_run_data_player1.png" style="zoom:67%;" />

    <img src="assets/15_run_data_player2.png" style="zoom:67%;" />

### **8. Project Progress**

| Support | Function                                                     |
| :-----: | ------------------------------------------------------------ |
|    ✅    | **Market Gateway**: Connect to the CTP Gateway in vnpy and send the market information as a subscription. |
|    ✅    | **Order Execution Gateway**: Process order requests from the strategy engine and send the request to the CTP Gateway in vnpy. |
|    ✅    | **Strategy Engine**: Import strategies and execute strategies, send order requests to the order execution gateway, print order reports and transaction reports. |
|    ✅    | **Risk Control Management**: Maintain position updates and position limit related alarms. |
|    ✅    | **Data Recording**: Record tick, order, trade, accounts, gateway_logs data locally. |
|    ✅    | **Strategy Backtesting**: Backtest strategies using historical data recorded by the data recorder. |
|    ✅    | **Market Replay**: Replay historical data recorded by the data recorder. |
|    ❎    | Internationalization: Supports Chinese and English.          |
|    ❎    | Visualization: Strategies, equity curves, drawdowns, etc. are drawn using the web. |
|    ❎    | Parameterized configuration: Move parameters such as initial funds, risk-free interest rates, and annualized days to configuration files or command line parameters. |
|    ❎    | Performance report: Optimize the calculation or display of performance reports |
|    ❎    | More mature risk control management                          |
|    ❎    | Strategy optimizer                                           |

Under development......

Strategy Backtesting

1. Run backtest on today's data, at maximum speed

     ```
     python -m zmq_services.backtester.run_backtest
     ```

2. Run backtest on a specific date 20250409

     ```
     python -m zmq_services.backtester.run_backtest --date 20250409
     ```

3. Run backtest on a specific date 20250409, in development mode

     ```
     python -m zmq_services.backtester.run_backtest --date 20250506 --config-env dev
     ```

4. Run backtest on a specific date 20250409, specifying the log output level

     ```bash
     python -m zmq_services.backtester.run_backtest --date 20250508 --log-level DEBUG
     ```

Market playback

1. Replay today's data at maximum speed.

     ```bash
     python -m zmq_services.backtester.run_backtest
     ```

3. Play back data from a specified date (e.g. 20250409) at near real-time speed (1x)

     ```bash
     python -m zmq_services.backtester.run_backtest --date 20250506 --speed 1
     ```

  4. Play back the data of the specified date at 10 times the speed

     ```bash
     python -m zmq_services.backtester.run_data_player --date 20250506 --speed 10
     ```

  5. Load data from different paths for playback

     ```bash
     python -m zmq_services.backtester.run_data_player --date 20250506 --path /path/to/other/data
     ```

### **9. Update log**

[CHANGELOG.md](CHANGELOG.md)

### **10. Communication**

QQ exchange group: `446042777` (Chengming Futures Research)

Gitcode address: https://gitcode.com/Nilotica/Nilotica

Gitee address: https://gitee.com/nilotica/Nilotica

GitHub address: https://github.com/Lumosylva/Nilotica

### **11. Disclaimer**

1. **Information is for reference only**
The information, data, analysis, advice or other content (hereinafter collectively referred to as "Information") provided by this system is for reference only and does not constitute any investment advice or trading guidance. When using this system, users should fully realize the high risk of futures trading and bear any risks and consequences arising therefrom.
2. **NO WARRANTY OF ACCURACY OR COMPLETENESS**
The information provided by this system may come from public market data, third-party institutions or other channels. Although we do our best to ensure the accuracy of the information, we cannot guarantee that it is completely error-free or up-to-date. Users should verify the relevant information on their own and are responsible for the decisions made based on such information.
3. **No liability**
The developer or provider of this system shall not bear any legal responsibility for any direct or indirect losses (including but not limited to transaction losses, data loss, system failure, etc.) caused by the user's use of this system or reliance on the information provided by this system.
4. **System risks and limitations**
This system may have technical failures, data delays, model errors or other unforeseen problems. Users should be fully aware of the limitations of the quantification system and exercise caution in their use. This system cannot be guaranteed to operate effectively under all market conditions.
5. **Users make their own decisions**
When using this system, users should make independent decisions based on their own investment objectives, risk tolerance and market judgment. This system does not assume any form of responsibility for users' trading behavior or investment results.
6. **Comply with laws and regulations**
When using this system, users should abide by relevant laws, regulations and exchange rules. Any legal consequences arising from the user's violation of laws, regulations or exchange rules shall be borne by the user himself.
7. **Right to modify the Disclaimer**
The final right of interpretation of this disclaimer belongs to the developer or provider of this system. We reserve the right to modify or update this Disclaimer at any time without prior notice.

**By using this system, you agree to all the terms of the above disclaimer. **