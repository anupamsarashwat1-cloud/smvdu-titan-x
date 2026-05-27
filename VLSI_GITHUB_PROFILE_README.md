# Hi there, I'm Anupam Sarashwat! 👋

<div align="center">
  <img src="https://img.shields.io/badge/Domain-VLSI%20%26%20Computer%20Architecture-005A9C?style=for-the-badge&logo=cpu&logoColor=white" alt="Domain Badge" />
  <img src="https://img.shields.io/badge/Affiliation-Shri%20Mata%20Vaishno%20Devi%20University-EF7B45?style=for-the-badge&logo=google-academic&logoColor=white" alt="SMVDU Affiliation Badge" />
  <img src="https://img.shields.io/badge/ISA-RISC--V%20(RV64%20%2F%20RV32)-5FBB46?style=for-the-badge&logo=riscv&logoColor=white" alt="RISC-V ISA Badge" />
</div>

---

### 🚀 About Me

I am a **VLSI Design & Computer Architecture Engineer** currently pursuing my **Bachelor of Technology in Electronics & Communication Engineering** at **Shri Mata Vaishno Devi University (SMVDU)**. My core expertise lies in digital logic design, RTL-to-GDSII physical implementation, FPGA emulation, and custom RISC-V processor architecting. 

I bridge the gap between abstract computer architectures and physical silicon, working with both industry-standard **Cadence Toolchains** and modern **Open-Source EDA toolsets**.

* **🔭 Current Focus**: Designing and implementing Linux-capable quad-core RV64GC SoCs targeted for SCL 180nm physical fabrication.
* **⚡ Key Strengths**: Standard-cell synthesis, STA, Clock Tree Synthesis (CTS), physical verification (DRC/LVS), DFT, and FPGA prototyping.
* **🏫 Academic Affiliation**: Shri Mata Vaishno Devi University (SMVDU), Katra, J&K, India.
* **📬 Let's Connect**: Open to research opportunities, internships, and collaborations in digital design and physical layout.

---

### 🛠️ Hardware Engineering Toolbox

| Category | Technologies & Tools |
| :--- | :--- |
| **Hardware Languages** | `Verilog HDL` • `C-Based VLSI Design` • `SystemVerilog (basics)` • `Logic Design` |
| **Industry EDA Tools** | `Cadence Genus Synthesis` • `Cadence Innovus` • `Cadence Modus (DFT)` • `Xilinx Vivado` • `ModelSim` |
| **Open-Source EDA Suite** | `Yosys` • `OpenSTA` • `Magic VLSI` • `Netgen` • `Qflow` • `KLayout` • `Icarus Verilog` • `OpenRAM` |
| **Core Methodologies** | `RTL-to-GDSII Flow` • `RTL Synthesis` • `Static Timing Analysis (STA)` • `Design for Testability (DFT)` • `DRC/LVS Verification` • `FPGA Prototyping & Emulation` |
| **PCB & Systems** | `Altium Designer` • `Analog Circuit Design` • `Breadboarding & Benchtop Oscilloscope Debugging` |
| **Software Languages** | `C` • `C++` • `Python` • `Tcl (EDA scripting)` • `Shell Scripting (Bash)` |

---

### 💼 Professional Experience

#### **VLSI Design Flow Intern (RTL to GDS-II)**
**National Institute of Electronics & Information Technology (NIELIT)** — CoE in Chip Design, Noida  
*June 2025 – July 2025* | **Grade Obtained: S (Highest)**
* **Hardware Modeling & Simulation**: Modeled and verified synthesizable digital design modules in Verilog HDL utilizing `Icarus Verilog`.
* **RTL Synthesis**: Synthesized high-performance logic circuits targeting standard-cell architectures utilizing `Yosys` to generate gate-level netlists.
* **Static Timing Analysis (STA)**: Evaluated setup/hold timing constraints and critical paths of the synthesized digital blocks using `OpenSTA` for performance optimization.
* **Physical Design & Backend**: Executed modern physical layout flows including Floorplanning, Power Grid Design, Placement, Clock Tree Synthesis (CTS), and Routing using `Qflow` and the `Magic` layout editor.
* **Physical Verification**: Achieved tape-out readiness and uniquely matched circuits with zero DRC/LVS violations using `Netgen` and Magic.

---

### 🌟 Featured VLSI Projects

#### 🛡️ **[SMVDU-TITAN-X: Advanced RISC-V SoC](https://github.com/anupamsarashwat1-cloud/smvdu-titan-x)**
*SCL 180nm CMOS 5-Hart RISC-V Multicore SoC | May 2026 – Present*
* **Phase 1: Bare-Metal Core Bring-Up**: Configured and validated a single RV64GC Rocket core with private 32KB L1 instruction/data caches, a SiFive UART peripheral block, and bare-metal firmware stubs.
* **Phase 2: Boot Infrastructure**: Designed a synthesizable first-stage BootROM, APB-to-TileLink 32-bit GPIO controller, and memory-mapped SPI Flash interface to execute OpenSBI boot firmware.
* **Phase 3: Linux-Capable SMP Cluster**: Scaled up to a coherent Quad-Core RV64GC Rocket complex with a shared inclusive 512KB banked L2 cache, 2GB LiteDRAM DDR space, and LiteETH Gigabit MAC.
* **Phase 4: High-Speed Serial I/O**: Integrated PCIe Gen2 (x4) controller with full LTSSM L0 training state machine, USB 2.0 OTG, and HDMI TMDS active colorbars generator on a dual-core topology.
* **Phase 5: Coprocessor & Accelerators**: Designed and integrated a tightly coupled 8x8 INT8 Systolic Array ML Coprocessor via the RoCC custom interface, dual-channel AXI4 HBM2 controller, and MMIO Cryptographic blocks (AES-256/SHA-3).
* **Final Unified Integration**: Completed a unified 5-Hart silicon-ready SoC (4x RV64GC Application cores + 1x RV64IMAC Monitor core) optimized for physical semiconductor tapeout (SCL 180nm node).
* **ASIC CAD & Verification Flow**: Authored production-grade scripts covering the complete 10-step silicon roadmap: SystemVerilog/UVM simulations with **Cadence Xcelium**, Block/Toggle/Expression coverage with **IMC**, multi-corner logical synthesis with **Genus**, scan-chain insertion and stuck-at/transition fault ATPG generation with **Modus**, Gate-Level Simulations (GLS) with SDF back-annotation, formal logical equivalence checking (LEC) with **Conformal**, and macro P&R implementation scripts with **Innovus** yielding tape-out readiness.

#### ⚡ **SMVDU-AHO-32: 32-bit RISC-V Processor Core**
*End-to-End Design, FPGA Prototyping & RTL-to-GDSII ASIC Flow | Dec 2025 – May 2026*
* **RTL Core**: Designed a single-cycle processor core conforming to the RISC-V RV32I base ISA in Verilog HDL featuring a Harvard memory architecture for deterministic single-cycle execution.
* **FPGA Validation**: Prototyped the design on a Xilinx Zynq-7000 SoC (PYNQ-Z2), achieving a **65 MHz** hardware operating frequency with highly optimized logic utilization (<5% LUTs/FFs).
* **ASIC Implementation**: Executed RTL-to-GDSII physical implementation targeting a 180nm CMOS standard-cell node, integrating a 2Kb compiled `OpenRAM` SRAM macro.
* **Metrics**: Achieved a core area of **0.82 mm²** (10,708 standard cells), **19.88 mW** total power dissipation, an estimated $F_{max}$ of **69.1 MHz**, and zero DRC/LVS violations.
* **Research Paper**: Co-authored the research paper, *"End-to-End Design, FPGA Prototyping and RTL-to-GDSII ASIC Implementation of a 32-bit RISC-V Processor,"* prepared for IEEE submission.

#### 🎛️ **SAP-2 Based 8-bit CPU**
*RTL Design, FPGA Validation & Physical Backend | Aug 2025 – Dec 2025*
* Authored complete RTL design of SAP-2 CPU datapath and control logic in synthesizable Verilog, implementing register-transfer level design for fetch, decode, and execute stages.
* Conducted functional simulation with directed testbenches and performed FPGA hardware validation on `PYNQ-Z2` confirming correct instruction execution behavior.
* Executed the complete physical backend design flow including logic synthesis, floorplanning, placement, and routing to analyze the 8-bit core's layout and timing metrics.

#### 📈 **Discrete Op-Amp Voltage Level Indicator**
*Analog Circuit Design & PCB Prototyping | Jan 2025 – May 2025*
* Designed and implemented a discrete "nude logic" voltage level indicator utilizing operational amplifiers configured as precision comparators.
* Engineered custom resistor divider networks to establish precise reference voltages, enabling accurate multi-level threshold detection and LED-based visual feedback.
* Designed a custom PCB layout using `Altium Designer` and executed in-house fabrication, validating threshold triggering and signal stability using benchtop oscilloscopes and DMMs.

---

### 🎓 Education

* **Shri Mata Vaishno Devi University (SMVDU)** — Katra, J&K, India  
  *Bachelor of Technology - Electronics & Communication Engineering* | **CGPA: 6.98**  
  *Aug 2023 – Expected May 2027*
* **New Era Public School** — Munger, Bihar, India  
  *HSC (12th Standard - CBSE)* | **Percentage: 68.2%**  
  *July 2020 – May 2022*
* **New Era Public School** — Munger, Bihar, India  
  *SSC (10th Standard - CBSE)* | **Percentage: 81.50%**  
  *April 2019 – May 2020*

---

### 📜 Certifications & Achievements

* **VLSI Design Flow: RTL to GDS**: NPTEL Elite Certification | Organized by *IIIT Delhi* (Jul-Oct 2025)
* **C-Based VLSI Design**: NPTEL Elite Certification | Organized by *IIT Guwahati* (Jul-Oct 2025)
* **Digital VLSI Testing**: NPTEL National Certification | Organized by *IIT Kharagpur* (Jan-Apr 2026)
* **NIELIT 'S' Grade**: Completed national-level 6-week intensive VLSI design training under NIELIT Centre of Excellence.
* **Constitutional Law & Public Administration**: NPTEL Elite Certification | Organized by *IIT Madras* (Jan-Apr 2026)

---

### 📊 GitHub Activity & Metrics

<div align="center">
  <table border="0">
    <tr>
      <td width="50%" align="center">
        <img src="https://github-readme-stats.vercel.app/api?username=anupamsarashwat1-cloud&show_icons=true&theme=calm&count_private=true" alt="GitHub Stats" width="400px"/>
      </td>
      <td width="50%" align="center">
        <img src="https://github-readme-stats.vercel.app/api/top-langs/?username=anupamsarashwat1-cloud&layout=compact&theme=calm&hide=html,css" alt="Top Languages" width="400px"/>
      </td>
    </tr>
  </table>
</div>

---

### 🤝 Let's Connect!

<div align="left">
  <a href="https://linkedin.com/in/anupam-sarashwat" target="_blank">
    <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn Badge" />
  </a>
  <a href="mailto:23bec014@smvdu.ac.in" target="_blank">
    <img src="https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white" alt="Email Badge" />
  </a>
  <a href="https://github.com/anupamsarashwat1-cloud" target="_blank">
    <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub Badge" />
  </a>
  <img src="https://img.shields.io/badge/Location-Katra,%20India-orange?style=for-the-badge&logo=google-maps&logoColor=white" alt="Location Badge" />
</div>

<br />
<div align="center">
  <sub>Generated with ❤️ for your professional VLSI portfolio. Copy this to your personal <code>anupamsarashwat1-cloud/anupamsarashwat1-cloud</code> repository README.</sub>
</div>
