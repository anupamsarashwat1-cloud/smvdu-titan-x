// LEC-specific netlist: titan_x_top only.
// Submodule definitions (axi4_to_ahb, axi4_crossbar, reset_sync) are removed.
// They will be resolved from blackbox library stubs loaded in lec.tcl.

module titan_x_top(sys_clk, eth_clk, pcie_refclk_p, pcie_refclk_n, sys_rst_n, ddr_ck_p, ddr_ck_n, ddr_cke, ddr_cs_n, ddr_ras_n, ddr_cas_n, ddr_we_n, ddr_ba, ddr_addr, ddr_dm, ddr_dq, ddr_dqs_p, ddr_dqs_n, pcie_txp, pcie_txn, pcie_rxp
, pcie_rxn, pcie_perst_n, gem0_rgmii_txc, gem0_rgmii_tx_ctl, gem0_rgmii_txd, gem0_rgmii_rxc, gem0_rgmii_rx_ctl, gem0_rgmii_rxd, gem1_rgmii_txc, gem1_rgmii_tx_ctl, gem1_rgmii_txd, gem1_rgmii_rxc, gem1_rgmii_rx_ctl, gem1_rgmii_rxd, uart0_txd, uart0_rxd, uart1_txd, uart1_rxd, gpio_pad, spi_clk, spi_mosi
, spi_miso, spi_csn, i2c_scl, i2c_sda, harts_active, link_up_pcie);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  wire _134_;
  wire _135_;
  wire _136_;
  wire _137_;
  wire _138_;
  wire _139_;
  wire _140_;
  wire _141_;
  wire _142_;
  wire _143_;
  wire _144_;
  wire _145_;
  wire _146_;
  wire _147_;
  wire _148_;
  wire _149_;
  wire _150_;
  wire _151_;
  wire _152_;
  wire _153_;
  wire _154_;
  wire _155_;
  wire _156_;
  wire _157_;
  wire _158_;
  wire _159_;
  wire _160_;
  wire _161_;
  wire _162_;
  wire _163_;
  wire _164_;
  wire _165_;
  wire _166_;
  wire _167_;
  wire _168_;
  wire _169_;
  wire _170_;
  wire _171_;
  wire _172_;
  wire _173_;
  wire _174_;
  wire _175_;
  wire _176_;
  wire _177_;
  wire _178_;
  wire _179_;
  wire _180_;
  wire _181_;
  wire _182_;
  wire _183_;
  wire _184_;
  wire _185_;
  wire _186_;
  wire _187_;
  wire _188_;
  wire _189_;
  wire _190_;
  wire _191_;
  wire _192_;
  wire _193_;
  wire _194_;
  wire _195_;
  wire _196_;
  wire _197_;
  wire _198_;
  wire _199_;
  wire _200_;
  wire _201_;
  wire _202_;
  wire _203_;
  wire _204_;
  wire _205_;
  wire _206_;
  wire _207_;
  wire _208_;
  wire _209_;
  wire _210_;
  wire _211_;
  wire _212_;
  wire _213_;
  wire _214_;
  wire _215_;
  wire _216_;
  wire _217_;
  wire _218_;
  wire _219_;
  wire _220_;
  wire _221_;
  wire _222_;
  wire _223_;
  wire _224_;
  wire _225_;
  wire _226_;
  wire _227_;
  wire _228_;
  wire _229_;
  wire _230_;
  wire _231_;
  wire _232_;
  wire _233_;
  wire _234_;
  wire _235_;
  wire _236_;
  wire _237_;
  wire _238_;
  wire _239_;
  wire _240_;
  wire _241_;
  wire _242_;
  wire _243_;
  wire _244_;
  wire _245_;
  wire _246_;
  wire _247_;
  wire _248_;
  wire _249_;
  wire _250_;
  wire _251_;
  wire _252_;
  wire _253_;
  wire _254_;
  wire _255_;
  wire _256_;
  wire _257_;
  wire _258_;
  wire _259_;
  wire _260_;
  wire _261_;
  wire _262_;
  wire _263_;
  wire _264_;
  wire _265_;
  wire _266_;
  wire _267_;
  wire _268_;
  wire _269_;
  wire _270_;
  wire _271_;
  wire _272_;
  wire _273_;
  wire _274_;
  wire _275_;
  wire _276_;
  wire _277_;
  wire _278_;
  wire _279_;
  wire _280_;
  wire _281_;
  wire _282_;
  wire _283_;
  wire _284_;
  wire _285_;
  wire _286_;
  wire _287_;
  wire _288_;
  wire _289_;
  wire _290_;
  wire _291_;
  wire _292_;
  wire _293_;
  wire _294_;
  wire _295_;
  wire _296_;
  wire _297_;
  wire _298_;
  wire _299_;
  wire _300_;
  wire _301_;
  wire _302_;
  wire _303_;
  wire _304_;
  wire _305_;
  wire _306_;
  wire _307_;
  wire _308_;
  wire _309_;
  wire aes_irq;
  wire [31:0] aes_prdata;
  wire aes_psel;
  wire [31:0] ahb_haddr;
  wire [31:0] ahb_hrdata;
  wire ahb_hready;
  wire ahb_hresp;
  wire [1:0] ahb_htrans;
  wire [31:0] ahb_hwdata;
  wire ahb_hwrite;
  wire [31:0] apb_paddr;
  wire apb_penable;
  wire [31:0] apb_prdata;
  wire apb_pready;
  wire apb_psel;
  wire [31:0] apb_pwdata;
  wire apb_pwrite;
  wire [39:0] cpu0_dmem_araddr;
  wire cpu0_dmem_arready;
  wire cpu0_dmem_arvalid;
  wire [39:0] cpu0_dmem_awaddr;
  wire cpu0_dmem_awready;
  wire cpu0_dmem_awvalid;
  wire cpu0_dmem_bready;
  wire cpu0_dmem_bvalid;
  wire [63:0] cpu0_dmem_rdata;
  wire cpu0_dmem_rready;
  wire [1:0] cpu0_dmem_rresp;
  wire cpu0_dmem_rvalid;
  wire [63:0] cpu0_dmem_wdata;
  wire cpu0_dmem_wready;
  wire [7:0] cpu0_dmem_wstrb;
  wire cpu0_dmem_wvalid;
  wire [39:0] cpu0_imem_araddr;
  wire cpu0_imem_arready;
  wire cpu0_imem_arvalid;
  wire [63:0] cpu0_imem_rdata;
  wire [1:0] cpu0_imem_rresp;
  wire cpu0_imem_rvalid;
  wire [39:0] cpu1_dmem_araddr;
  wire cpu1_dmem_arready;
  wire cpu1_dmem_arvalid;
  wire [39:0] cpu1_dmem_awaddr;
  wire cpu1_dmem_awready;
  wire cpu1_dmem_awvalid;
  wire cpu1_dmem_bready;
  wire cpu1_dmem_bvalid;
  wire [63:0] cpu1_dmem_rdata;
  wire cpu1_dmem_rready;
  wire [1:0] cpu1_dmem_rresp;
  wire cpu1_dmem_rvalid;
  wire [63:0] cpu1_dmem_wdata;
  wire cpu1_dmem_wready;
  wire [7:0] cpu1_dmem_wstrb;
  wire cpu1_dmem_wvalid;
  wire [39:0] cpu1_imem_araddr;
  wire cpu1_imem_arready;
  wire cpu1_imem_arvalid;
  wire [63:0] cpu1_imem_rdata;
  wire [1:0] cpu1_imem_rresp;
  wire cpu1_imem_rvalid;
  wire [39:0] cpu2_dmem_araddr;
  wire cpu2_dmem_arready;
  wire cpu2_dmem_arvalid;
  wire [39:0] cpu2_dmem_awaddr;
  wire cpu2_dmem_awready;
  wire cpu2_dmem_awvalid;
  wire cpu2_dmem_bready;
  wire cpu2_dmem_bvalid;
  wire [63:0] cpu2_dmem_rdata;
  wire cpu2_dmem_rready;
  wire [1:0] cpu2_dmem_rresp;
  wire cpu2_dmem_rvalid;
  wire [63:0] cpu2_dmem_wdata;
  wire cpu2_dmem_wready;
  wire [7:0] cpu2_dmem_wstrb;
  wire cpu2_dmem_wvalid;
  wire [39:0] cpu2_imem_araddr;
  wire cpu2_imem_arready;
  wire cpu2_imem_arvalid;
  wire [63:0] cpu2_imem_rdata;
  wire [1:0] cpu2_imem_rresp;
  wire cpu2_imem_rvalid;
  wire [39:0] cpu3_dmem_araddr;
  wire cpu3_dmem_arready;
  wire cpu3_dmem_arvalid;
  wire [39:0] cpu3_dmem_awaddr;
  wire cpu3_dmem_awready;
  wire cpu3_dmem_awvalid;
  wire cpu3_dmem_bready;
  wire cpu3_dmem_bvalid;
  wire [63:0] cpu3_dmem_rdata;
  wire cpu3_dmem_rready;
  wire [1:0] cpu3_dmem_rresp;
  wire cpu3_dmem_rvalid;
  wire [63:0] cpu3_dmem_wdata;
  wire cpu3_dmem_wready;
  wire [7:0] cpu3_dmem_wstrb;
  wire cpu3_dmem_wvalid;
  wire [39:0] cpu3_imem_araddr;
  wire cpu3_imem_arready;
  wire cpu3_imem_arvalid;
  wire [63:0] cpu3_imem_rdata;
  wire [1:0] cpu3_imem_rresp;
  wire cpu3_imem_rvalid;
  wire [39:0] cpu4_dmem_araddr;
  wire cpu4_dmem_arready;
  wire cpu4_dmem_arvalid;
  wire [39:0] cpu4_dmem_awaddr;
  wire cpu4_dmem_awready;
  wire cpu4_dmem_awvalid;
  wire cpu4_dmem_bready;
  wire cpu4_dmem_bvalid;
  wire [63:0] cpu4_dmem_rdata;
  wire cpu4_dmem_rready;
  wire [1:0] cpu4_dmem_rresp;
  wire cpu4_dmem_rvalid;
  wire [63:0] cpu4_dmem_wdata;
  wire cpu4_dmem_wready;
  wire [7:0] cpu4_dmem_wstrb;
  wire cpu4_dmem_wvalid;
  wire [39:0] cpu4_imem_araddr;
  wire cpu4_imem_arready;
  wire cpu4_imem_arvalid;
  wire [63:0] cpu4_imem_rdata;
  wire [1:0] cpu4_imem_rresp;
  wire cpu4_imem_rvalid;
  output [15:0] ddr_addr;
  wire [15:0] ddr_addr;
  output [2:0] ddr_ba;
  wire [2:0] ddr_ba;
  output ddr_cas_n;
  wire ddr_cas_n;
  output ddr_ck_n;
  wire ddr_ck_n;
  output ddr_ck_p;
  wire ddr_ck_p;
  output ddr_cke;
  wire ddr_cke;
  output ddr_cs_n;
  wire ddr_cs_n;
  output [7:0] ddr_dm;
  wire [7:0] ddr_dm;
  inout [63:0] ddr_dq;
  wire [63:0] ddr_dq;
  inout [7:0] ddr_dqs_n;
  wire [7:0] ddr_dqs_n;
  inout [7:0] ddr_dqs_p;
  wire [7:0] ddr_dqs_p;
  output ddr_ras_n;
  wire ddr_ras_n;
  wire [39:0] ddr_s_araddr;
  wire [3:0] ddr_s_arid;
  wire [7:0] ddr_s_arlen;
  wire ddr_s_arready;
  wire ddr_s_arvalid;
  wire [39:0] ddr_s_awaddr;
  wire [3:0] ddr_s_awid;
  wire [7:0] ddr_s_awlen;
  wire ddr_s_awready;
  wire [2:0] ddr_s_awsize;
  wire ddr_s_awvalid;
  wire [3:0] ddr_s_bid;
  wire ddr_s_bready;
  wire [1:0] ddr_s_bresp;
  wire ddr_s_bvalid;
  wire [63:0] ddr_s_rdata;
  wire [3:0] ddr_s_rid;
  wire ddr_s_rlast;
  wire ddr_s_rready;
  wire [1:0] ddr_s_rresp;
  wire ddr_s_rvalid;
  wire [63:0] ddr_s_wdata;
  wire ddr_s_wlast;
  wire ddr_s_wready;
  wire [7:0] ddr_s_wstrb;
  wire ddr_s_wvalid;
  output ddr_we_n;
  wire ddr_we_n;
  input eth_clk;
  wire eth_clk;
  wire gem0_irq;
  wire gem0_m_arvalid;
  wire gem0_m_awvalid;
  wire gem0_m_wvalid;
  input gem0_rgmii_rx_ctl;
  wire gem0_rgmii_rx_ctl;
  input gem0_rgmii_rxc;
  wire gem0_rgmii_rxc;
  input [3:0] gem0_rgmii_rxd;
  wire [3:0] gem0_rgmii_rxd;
  output gem0_rgmii_tx_ctl;
  wire gem0_rgmii_tx_ctl;
  output gem0_rgmii_txc;
  wire gem0_rgmii_txc;
  output [3:0] gem0_rgmii_txd;
  wire [3:0] gem0_rgmii_txd;
  wire gem1_irq;
  wire gem1_m_arvalid_w;
  wire gem1_m_awvalid_w;
  wire gem1_m_wvalid_w;
  input gem1_rgmii_rx_ctl;
  wire gem1_rgmii_rx_ctl;
  input gem1_rgmii_rxc;
  wire gem1_rgmii_rxc;
  input [3:0] gem1_rgmii_rxd;
  wire [3:0] gem1_rgmii_rxd;
  output gem1_rgmii_tx_ctl;
  wire gem1_rgmii_tx_ctl;
  output gem1_rgmii_txc;
  wire gem1_rgmii_txc;
  output [3:0] gem1_rgmii_txd;
  wire [3:0] gem1_rgmii_txd;
  wire gpio_irq;
  inout [31:0] gpio_pad;
  wire [31:0] gpio_pad;
  wire [31:0] gpio_prdata;
  wire gpio_pready;
  wire gpio_psel;
  output [4:0] harts_active;
  wire [4:0] harts_active;
  wire i2c_irq;
  wire [31:0] i2c_prdata;
  wire i2c_pready;
  wire i2c_psel;
  inout i2c_scl;
  wire i2c_scl;
  inout i2c_sda;
  wire i2c_sda;
  wire [18:0] irq_sources;
  wire [39:0] l2_s_araddr;
  wire l2_s_arready;
  wire l2_s_arvalid;
  wire [39:0] l2_s_awaddr;
  wire l2_s_awready;
  wire l2_s_awvalid;
  wire [3:0] l2_s_bid;
  wire l2_s_bready;
  wire [1:0] l2_s_bresp;
  wire l2_s_bvalid;
  wire [63:0] l2_s_rdata;
  wire [3:0] l2_s_rid;
  wire l2_s_rlast;
  wire l2_s_rready;
  wire [1:0] l2_s_rresp;
  wire l2_s_rvalid;
  wire [63:0] l2_s_wdata;
  wire l2_s_wlast;
  wire l2_s_wready;
  wire [7:0] l2_s_wstrb;
  wire l2_s_wvalid;
  output link_up_pcie;
  wire link_up_pcie;
  wire pcie_irq;
  output pcie_perst_n;
  wire pcie_perst_n;
  input pcie_refclk_n;
  wire pcie_refclk_n;
  input pcie_refclk_p;
  wire pcie_refclk_p;
  input [3:0] pcie_rxn;
  wire [3:0] pcie_rxn;
  input [3:0] pcie_rxp;
  wire [3:0] pcie_rxp;
  output [3:0] pcie_txn;
  wire [3:0] pcie_txn;
  output [3:0] pcie_txp;
  wire [3:0] pcie_txp;
  wire [39:0] s2_araddr_x;
  wire s2_arready_x;
  wire s2_arvalid_x;
  wire [39:0] s2_awaddr_x;
  wire s2_awready_x;
  wire s2_awvalid_x;
  wire s2_bready_x;
  wire s2_bvalid_x;
  wire [63:0] s2_rdata_x;
  wire s2_rready_x;
  wire s2_rvalid_x;
  wire [63:0] s2_wdata_x;
  wire s2_wready_x;
  wire [7:0] s2_wstrb_x;
  wire s2_wvalid_x;
  wire [39:0] s3_araddr_x;
  wire s3_arready_x;
  wire s3_arvalid_x;
  wire [39:0] s3_awaddr_x;
  wire s3_awready_x;
  wire s3_awvalid_x;
  wire s3_bready_x;
  wire s3_bvalid_x;
  wire [31:0] s3_rdata_x;
  wire s3_rready_x;
  wire s3_rvalid_x;
  wire [63:0] s3_wdata_x;
  wire s3_wready_x;
  wire [7:0] s3_wstrb_x;
  wire s3_wvalid_x;
  wire [39:0] s4_araddr_x;
  wire s4_arready_x;
  wire s4_arvalid_x;
  wire [39:0] s4_awaddr_x;
  wire s4_awready_x;
  wire s4_awvalid_x;
  wire s4_bready_x;
  wire s4_bvalid_x;
  wire [63:0] s4_rdata_x;
  wire s4_rready_x;
  wire s4_rvalid_x;
  wire [63:0] s4_wdata_x;
  wire s4_wready_x;
  wire [7:0] s4_wstrb_x;
  wire s4_wvalid_x;
  wire [39:0] s5_araddr_x;
  wire s5_arready_x;
  wire s5_arvalid_x;
  wire [39:0] s5_awaddr_x;
  wire s5_awready_x;
  wire s5_awvalid_x;
  wire s5_bready_x;
  wire s5_bvalid_x;
  wire [63:0] s5_rdata_x;
  wire s5_rready_x;
  wire s5_rvalid_x;
  wire [63:0] s5_wdata_x;
  wire s5_wready_x;
  wire [7:0] s5_wstrb_x;
  wire s5_wvalid_x;
  wire [39:0] s6_araddr_x;
  wire s6_arready_x;
  wire s6_arvalid_x;
  wire [39:0] s6_awaddr_x;
  wire s6_awready_x;
  wire s6_awvalid_x;
  wire s6_bready_x;
  wire s6_bvalid_x;
  wire [31:0] s6_rdata_x;
  wire s6_rready_x;
  wire s6_rvalid_x;
  wire [63:0] s6_wdata_x;
  wire s6_wready_x;
  wire [7:0] s6_wstrb_x;
  wire s6_wvalid_x;
  wire [39:0] s7_araddr_x;
  wire s7_arready_x;
  wire s7_arvalid_x;
  wire [39:0] s7_awaddr_x;
  wire s7_awready_x;
  wire s7_awvalid_x;
  wire s7_bready_x;
  wire s7_bvalid_x;
  wire [31:0] s7_rdata_x;
  wire s7_rready_x;
  wire s7_rvalid_x;
  wire [63:0] s7_wdata_x;
  wire s7_wready_x;
  wire [7:0] s7_wstrb_x;
  wire s7_wvalid_x;
  wire sha_irq;
  wire [31:0] sha_prdata;
  wire sha_psel;
  output spi_clk;
  wire spi_clk;
  output [3:0] spi_csn;
  wire [3:0] spi_csn;
  wire [3:0] spi_csn_w;
  wire spi_irq;
  input spi_miso;
  wire spi_miso;
  output spi_mosi;
  wire spi_mosi;
  wire [31:0] spi_prdata;
  wire spi_pready;
  wire spi_psel;
  wire sync_rst_n;
  input sys_clk;
  wire sys_clk;
  input sys_rst_n;
  wire sys_rst_n;
  wire trng_irq;
  wire [31:0] trng_prdata;
  wire trng_psel;
  wire uart0_irq;
  wire [31:0] uart0_prdata;
  wire uart0_pready;
  wire uart0_psel;
  input uart0_rxd;
  wire uart0_rxd;
  output uart0_txd;
  wire uart0_txd;
  wire uart1_irq;
  wire [31:0] uart1_prdata;
  wire uart1_pready;
  wire uart1_psel;
  input uart1_rxd;
  wire uart1_rxd;
  output uart1_txd;
  wire uart1_txd;
  wire wdt_irq;
  wire [31:0] wdt_prdata;
  wire wdt_pready;
  wire wdt_psel;
  wire wdt_rst_n;
  INVX1 _310_ (
    .A(apb_paddr[17]),
    .Y(_000_)
  );
  INVX1 _311_ (
    .A(apb_paddr[19]),
    .Y(_001_)
  );
  INVX1 _312_ (
    .A(apb_paddr[18]),
    .Y(_002_)
  );
  INVX1 _313_ (
    .A(s7_araddr_x[17]),
    .Y(_003_)
  );
  INVX1 _314_ (
    .A(wdt_prdata[0]),
    .Y(_004_)
  );
  INVX1 _315_ (
    .A(i2c_prdata[0]),
    .Y(_005_)
  );
  INVX1 _316_ (
    .A(spi_prdata[0]),
    .Y(_006_)
  );
  INVX1 _317_ (
    .A(wdt_prdata[2]),
    .Y(_007_)
  );
  INVX1 _318_ (
    .A(i2c_prdata[2]),
    .Y(_008_)
  );
  INVX1 _319_ (
    .A(spi_prdata[2]),
    .Y(_009_)
  );
  INVX1 _320_ (
    .A(wdt_prdata[3]),
    .Y(_010_)
  );
  INVX1 _321_ (
    .A(i2c_prdata[3]),
    .Y(_011_)
  );
  INVX1 _322_ (
    .A(spi_prdata[3]),
    .Y(_012_)
  );
  INVX1 _323_ (
    .A(wdt_prdata[5]),
    .Y(_013_)
  );
  INVX1 _324_ (
    .A(i2c_prdata[5]),
    .Y(_014_)
  );
  INVX1 _325_ (
    .A(spi_prdata[5]),
    .Y(_015_)
  );
  INVX1 _326_ (
    .A(wdt_prdata[7]),
    .Y(_016_)
  );
  INVX1 _327_ (
    .A(i2c_prdata[7]),
    .Y(_017_)
  );
  INVX1 _328_ (
    .A(spi_prdata[7]),
    .Y(_018_)
  );
  INVX1 _329_ (
    .A(wdt_prdata[9]),
    .Y(_019_)
  );
  INVX1 _330_ (
    .A(i2c_prdata[9]),
    .Y(_020_)
  );
  INVX1 _331_ (
    .A(spi_prdata[9]),
    .Y(_021_)
  );
  INVX1 _332_ (
    .A(wdt_prdata[10]),
    .Y(_022_)
  );
  INVX1 _333_ (
    .A(i2c_prdata[10]),
    .Y(_023_)
  );
  INVX1 _334_ (
    .A(spi_prdata[10]),
    .Y(_024_)
  );
  INVX1 _335_ (
    .A(wdt_prdata[11]),
    .Y(_025_)
  );
  INVX1 _336_ (
    .A(i2c_prdata[11]),
    .Y(_026_)
  );
  INVX1 _337_ (
    .A(spi_prdata[11]),
    .Y(_027_)
  );
  INVX1 _338_ (
    .A(wdt_prdata[12]),
    .Y(_028_)
  );
  INVX1 _339_ (
    .A(i2c_prdata[12]),
    .Y(_029_)
  );
  INVX1 _340_ (
    .A(spi_prdata[12]),
    .Y(_030_)
  );
  INVX1 _341_ (
    .A(wdt_prdata[14]),
    .Y(_031_)
  );
  INVX1 _342_ (
    .A(i2c_prdata[14]),
    .Y(_032_)
  );
  INVX1 _343_ (
    .A(spi_prdata[14]),
    .Y(_033_)
  );
  INVX1 _344_ (
    .A(wdt_prdata[15]),
    .Y(_034_)
  );
  INVX1 _345_ (
    .A(i2c_prdata[15]),
    .Y(_035_)
  );
  INVX1 _346_ (
    .A(spi_prdata[15]),
    .Y(_036_)
  );
  INVX1 _347_ (
    .A(wdt_prdata[16]),
    .Y(_037_)
  );
  INVX1 _348_ (
    .A(i2c_prdata[16]),
    .Y(_038_)
  );
  INVX1 _349_ (
    .A(spi_prdata[16]),
    .Y(_039_)
  );
  INVX1 _350_ (
    .A(wdt_prdata[18]),
    .Y(_040_)
  );
  INVX1 _351_ (
    .A(i2c_prdata[18]),
    .Y(_041_)
  );
  INVX1 _352_ (
    .A(spi_prdata[18]),
    .Y(_042_)
  );
  INVX1 _353_ (
    .A(wdt_prdata[19]),
    .Y(_043_)
  );
  INVX1 _354_ (
    .A(i2c_prdata[19]),
    .Y(_044_)
  );
  INVX1 _355_ (
    .A(spi_prdata[19]),
    .Y(_045_)
  );
  INVX1 _356_ (
    .A(wdt_prdata[21]),
    .Y(_046_)
  );
  INVX1 _357_ (
    .A(i2c_prdata[21]),
    .Y(_047_)
  );
  INVX1 _358_ (
    .A(spi_prdata[21]),
    .Y(_048_)
  );
  INVX1 _359_ (
    .A(wdt_prdata[23]),
    .Y(_049_)
  );
  INVX1 _360_ (
    .A(i2c_prdata[23]),
    .Y(_050_)
  );
  INVX1 _361_ (
    .A(spi_prdata[23]),
    .Y(_051_)
  );
  INVX1 _362_ (
    .A(wdt_prdata[25]),
    .Y(_052_)
  );
  INVX1 _363_ (
    .A(i2c_prdata[25]),
    .Y(_053_)
  );
  INVX1 _364_ (
    .A(spi_prdata[25]),
    .Y(_054_)
  );
  INVX1 _365_ (
    .A(wdt_prdata[26]),
    .Y(_055_)
  );
  INVX1 _366_ (
    .A(i2c_prdata[26]),
    .Y(_056_)
  );
  INVX1 _367_ (
    .A(spi_prdata[26]),
    .Y(_057_)
  );
  INVX1 _368_ (
    .A(wdt_prdata[27]),
    .Y(_058_)
  );
  INVX1 _369_ (
    .A(i2c_prdata[27]),
    .Y(_059_)
  );
  INVX1 _370_ (
    .A(spi_prdata[27]),
    .Y(_060_)
  );
  INVX1 _371_ (
    .A(wdt_prdata[28]),
    .Y(_061_)
  );
  INVX1 _372_ (
    .A(i2c_prdata[28]),
    .Y(_062_)
  );
  INVX1 _373_ (
    .A(spi_prdata[28]),
    .Y(_063_)
  );
  INVX1 _374_ (
    .A(wdt_prdata[30]),
    .Y(_064_)
  );
  INVX1 _375_ (
    .A(i2c_prdata[30]),
    .Y(_065_)
  );
  INVX1 _376_ (
    .A(spi_prdata[30]),
    .Y(_066_)
  );
  INVX1 _377_ (
    .A(wdt_prdata[31]),
    .Y(_067_)
  );
  INVX1 _378_ (
    .A(i2c_prdata[31]),
    .Y(_068_)
  );
  INVX1 _379_ (
    .A(spi_prdata[31]),
    .Y(_069_)
  );
  OR2X1 _380_ (
    .A(apb_paddr[16]),
    .B(apb_paddr[17]),
    .Y(_070_)
  );
  NAND3X1 _381_ (
    .A(_001_),
    .B(_002_),
    .C(apb_psel),
    .Y(_071_)
  );
  OR2X1 _382_ (
    .A(_070_),
    .B(_071_),
    .Y(_072_)
  );
  INVX1 _383_ (
    .A(_072_),
    .Y(uart0_psel)
  );
  NAND2X1 _384_ (
    .A(apb_paddr[16]),
    .B(_000_),
    .Y(_073_)
  );
  OR2X1 _385_ (
    .A(_071_),
    .B(_073_),
    .Y(_074_)
  );
  INVX1 _386_ (
    .A(_074_),
    .Y(uart1_psel)
  );
  OR2X1 _387_ (
    .A(apb_paddr[16]),
    .B(_000_),
    .Y(_075_)
  );
  OR2X1 _388_ (
    .A(_071_),
    .B(_075_),
    .Y(_076_)
  );
  INVX1 _389_ (
    .A(_076_),
    .Y(gpio_psel)
  );
  NAND2X1 _390_ (
    .A(apb_paddr[16]),
    .B(apb_paddr[17]),
    .Y(_077_)
  );
  NOR2X1 _391_ (
    .A(_071_),
    .B(_077_),
    .Y(spi_psel)
  );
  NAND3X1 _392_ (
    .A(_001_),
    .B(apb_paddr[18]),
    .C(apb_psel),
    .Y(_078_)
  );
  NOR2X1 _393_ (
    .A(_070_),
    .B(_078_),
    .Y(i2c_psel)
  );
  NOR2X1 _394_ (
    .A(_073_),
    .B(_078_),
    .Y(wdt_psel)
  );
  NAND2X1 _395_ (
    .A(_003_),
    .B(s7_arvalid_x),
    .Y(_079_)
  );
  OR2X1 _396_ (
    .A(s7_araddr_x[19]),
    .B(s7_araddr_x[18]),
    .Y(_080_)
  );
  OR2X1 _397_ (
    .A(s7_araddr_x[16]),
    .B(_080_),
    .Y(_081_)
  );
  NOR2X1 _398_ (
    .A(_079_),
    .B(_081_),
    .Y(aes_psel)
  );
  NAND3X1 _399_ (
    .A(_003_),
    .B(s7_araddr_x[16]),
    .C(s7_arvalid_x),
    .Y(_082_)
  );
  NOR2X1 _400_ (
    .A(_080_),
    .B(_082_),
    .Y(sha_psel)
  );
  NAND2X1 _401_ (
    .A(s7_araddr_x[17]),
    .B(s7_arvalid_x),
    .Y(_083_)
  );
  NOR2X1 _402_ (
    .A(_081_),
    .B(_083_),
    .Y(trng_psel)
  );
  AOI22X1 _403_ (
    .A(_005_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_004_),
    .Y(_084_)
  );
  NAND2X1 _404_ (
    .A(_006_),
    .B(spi_psel),
    .Y(_085_)
  );
  OR2X1 _405_ (
    .A(gpio_prdata[0]),
    .B(_076_),
    .Y(_086_)
  );
  NAND3X1 _406_ (
    .A(_084_),
    .B(_085_),
    .C(_086_),
    .Y(_087_)
  );
  NOR2X1 _407_ (
    .A(uart1_prdata[0]),
    .B(_074_),
    .Y(_088_)
  );
  NOR2X1 _408_ (
    .A(uart0_prdata[0]),
    .B(_072_),
    .Y(_089_)
  );
  NOR3X1 _409_ (
    .A(_087_),
    .B(_088_),
    .C(_089_),
    .Y(apb_prdata[0])
  );
  AOI22X1 _410_ (
    .A(uart1_prdata[1]),
    .B(uart1_psel),
    .C(wdt_psel),
    .D(wdt_prdata[1]),
    .Y(_090_)
  );
  AOI22X1 _411_ (
    .A(gpio_prdata[1]),
    .B(gpio_psel),
    .C(spi_psel),
    .D(spi_prdata[1]),
    .Y(_091_)
  );
  AOI22X1 _412_ (
    .A(uart0_prdata[1]),
    .B(uart0_psel),
    .C(i2c_psel),
    .D(i2c_prdata[1]),
    .Y(_092_)
  );
  NAND3X1 _413_ (
    .A(_090_),
    .B(_091_),
    .C(_092_),
    .Y(apb_prdata[1])
  );
  AOI22X1 _414_ (
    .A(_008_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_007_),
    .Y(_093_)
  );
  NAND2X1 _415_ (
    .A(_009_),
    .B(spi_psel),
    .Y(_094_)
  );
  OR2X1 _416_ (
    .A(gpio_prdata[2]),
    .B(_076_),
    .Y(_095_)
  );
  NAND3X1 _417_ (
    .A(_093_),
    .B(_094_),
    .C(_095_),
    .Y(_096_)
  );
  NOR2X1 _418_ (
    .A(uart1_prdata[2]),
    .B(_074_),
    .Y(_097_)
  );
  NOR2X1 _419_ (
    .A(uart0_prdata[2]),
    .B(_072_),
    .Y(_098_)
  );
  NOR3X1 _420_ (
    .A(_096_),
    .B(_097_),
    .C(_098_),
    .Y(apb_prdata[2])
  );
  AOI22X1 _421_ (
    .A(_011_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_010_),
    .Y(_099_)
  );
  NAND2X1 _422_ (
    .A(_012_),
    .B(spi_psel),
    .Y(_100_)
  );
  OR2X1 _423_ (
    .A(gpio_prdata[3]),
    .B(_076_),
    .Y(_101_)
  );
  NAND3X1 _424_ (
    .A(_099_),
    .B(_100_),
    .C(_101_),
    .Y(_102_)
  );
  NOR2X1 _425_ (
    .A(uart1_prdata[3]),
    .B(_074_),
    .Y(_103_)
  );
  NOR2X1 _426_ (
    .A(uart0_prdata[3]),
    .B(_072_),
    .Y(_104_)
  );
  NOR3X1 _427_ (
    .A(_102_),
    .B(_103_),
    .C(_104_),
    .Y(apb_prdata[3])
  );
  AOI22X1 _428_ (
    .A(uart1_prdata[4]),
    .B(uart1_psel),
    .C(wdt_psel),
    .D(wdt_prdata[4]),
    .Y(_105_)
  );
  AOI22X1 _429_ (
    .A(gpio_prdata[4]),
    .B(gpio_psel),
    .C(spi_psel),
    .D(spi_prdata[4]),
    .Y(_106_)
  );
  AOI22X1 _430_ (
    .A(uart0_prdata[4]),
    .B(uart0_psel),
    .C(i2c_psel),
    .D(i2c_prdata[4]),
    .Y(_107_)
  );
  NAND3X1 _431_ (
    .A(_105_),
    .B(_106_),
    .C(_107_),
    .Y(apb_prdata[4])
  );
  AOI22X1 _432_ (
    .A(_014_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_013_),
    .Y(_108_)
  );
  NAND2X1 _433_ (
    .A(_015_),
    .B(spi_psel),
    .Y(_109_)
  );
  OR2X1 _434_ (
    .A(gpio_prdata[5]),
    .B(_076_),
    .Y(_110_)
  );
  NAND3X1 _435_ (
    .A(_108_),
    .B(_109_),
    .C(_110_),
    .Y(_111_)
  );
  NOR2X1 _436_ (
    .A(uart1_prdata[5]),
    .B(_074_),
    .Y(_112_)
  );
  NOR2X1 _437_ (
    .A(uart0_prdata[5]),
    .B(_072_),
    .Y(_113_)
  );
  NOR3X1 _438_ (
    .A(_111_),
    .B(_112_),
    .C(_113_),
    .Y(apb_prdata[5])
  );
  AOI22X1 _439_ (
    .A(uart1_prdata[6]),
    .B(uart1_psel),
    .C(wdt_psel),
    .D(wdt_prdata[6]),
    .Y(_114_)
  );
  AOI22X1 _440_ (
    .A(gpio_prdata[6]),
    .B(gpio_psel),
    .C(spi_psel),
    .D(spi_prdata[6]),
    .Y(_115_)
  );
  AOI22X1 _441_ (
    .A(uart0_prdata[6]),
    .B(uart0_psel),
    .C(i2c_psel),
    .D(i2c_prdata[6]),
    .Y(_116_)
  );
  NAND3X1 _442_ (
    .A(_114_),
    .B(_115_),
    .C(_116_),
    .Y(apb_prdata[6])
  );
  AOI22X1 _443_ (
    .A(_017_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_016_),
    .Y(_117_)
  );
  NAND2X1 _444_ (
    .A(_018_),
    .B(spi_psel),
    .Y(_118_)
  );
  OR2X1 _445_ (
    .A(gpio_prdata[7]),
    .B(_076_),
    .Y(_119_)
  );
  NAND3X1 _446_ (
    .A(_117_),
    .B(_118_),
    .C(_119_),
    .Y(_120_)
  );
  NOR2X1 _447_ (
    .A(uart1_prdata[7]),
    .B(_074_),
    .Y(_121_)
  );
  NOR2X1 _448_ (
    .A(uart0_prdata[7]),
    .B(_072_),
    .Y(_122_)
  );
  NOR3X1 _449_ (
    .A(_120_),
    .B(_121_),
    .C(_122_),
    .Y(apb_prdata[7])
  );
  AOI22X1 _450_ (
    .A(uart1_prdata[8]),
    .B(uart1_psel),
    .C(wdt_psel),
    .D(wdt_prdata[8]),
    .Y(_123_)
  );
  AOI22X1 _451_ (
    .A(gpio_prdata[8]),
    .B(gpio_psel),
    .C(spi_psel),
    .D(spi_prdata[8]),
    .Y(_124_)
  );
  AOI22X1 _452_ (
    .A(uart0_prdata[8]),
    .B(uart0_psel),
    .C(i2c_psel),
    .D(i2c_prdata[8]),
    .Y(_125_)
  );
  NAND3X1 _453_ (
    .A(_123_),
    .B(_124_),
    .C(_125_),
    .Y(apb_prdata[8])
  );
  AOI22X1 _454_ (
    .A(_020_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_019_),
    .Y(_126_)
  );
  NAND2X1 _455_ (
    .A(_021_),
    .B(spi_psel),
    .Y(_127_)
  );
  OR2X1 _456_ (
    .A(gpio_prdata[9]),
    .B(_076_),
    .Y(_128_)
  );
  NAND3X1 _457_ (
    .A(_126_),
    .B(_127_),
    .C(_128_),
    .Y(_129_)
  );
  NOR2X1 _458_ (
    .A(uart1_prdata[9]),
    .B(_074_),
    .Y(_130_)
  );
  NOR2X1 _459_ (
    .A(uart0_prdata[9]),
    .B(_072_),
    .Y(_131_)
  );
  NOR3X1 _460_ (
    .A(_129_),
    .B(_130_),
    .C(_131_),
    .Y(apb_prdata[9])
  );
  AOI22X1 _461_ (
    .A(_023_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_022_),
    .Y(_132_)
  );
  NAND2X1 _462_ (
    .A(_024_),
    .B(spi_psel),
    .Y(_133_)
  );
  OR2X1 _463_ (
    .A(gpio_prdata[10]),
    .B(_076_),
    .Y(_134_)
  );
  NAND3X1 _464_ (
    .A(_132_),
    .B(_133_),
    .C(_134_),
    .Y(_135_)
  );
  NOR2X1 _465_ (
    .A(uart1_prdata[10]),
    .B(_074_),
    .Y(_136_)
  );
  NOR2X1 _466_ (
    .A(uart0_prdata[10]),
    .B(_072_),
    .Y(_137_)
  );
  NOR3X1 _467_ (
    .A(_135_),
    .B(_136_),
    .C(_137_),
    .Y(apb_prdata[10])
  );
  AOI22X1 _468_ (
    .A(_026_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_025_),
    .Y(_138_)
  );
  NAND2X1 _469_ (
    .A(_027_),
    .B(spi_psel),
    .Y(_139_)
  );
  OR2X1 _470_ (
    .A(gpio_prdata[11]),
    .B(_076_),
    .Y(_140_)
  );
  NAND3X1 _471_ (
    .A(_138_),
    .B(_139_),
    .C(_140_),
    .Y(_141_)
  );
  NOR2X1 _472_ (
    .A(uart1_prdata[11]),
    .B(_074_),
    .Y(_142_)
  );
  NOR2X1 _473_ (
    .A(uart0_prdata[11]),
    .B(_072_),
    .Y(_143_)
  );
  NOR3X1 _474_ (
    .A(_141_),
    .B(_142_),
    .C(_143_),
    .Y(apb_prdata[11])
  );
  AOI22X1 _475_ (
    .A(_029_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_028_),
    .Y(_144_)
  );
  NAND2X1 _476_ (
    .A(_030_),
    .B(spi_psel),
    .Y(_145_)
  );
  OR2X1 _477_ (
    .A(gpio_prdata[12]),
    .B(_076_),
    .Y(_146_)
  );
  NAND3X1 _478_ (
    .A(_144_),
    .B(_145_),
    .C(_146_),
    .Y(_147_)
  );
  NOR2X1 _479_ (
    .A(uart1_prdata[12]),
    .B(_074_),
    .Y(_148_)
  );
  NOR2X1 _480_ (
    .A(uart0_prdata[12]),
    .B(_072_),
    .Y(_149_)
  );
  NOR3X1 _481_ (
    .A(_147_),
    .B(_148_),
    .C(_149_),
    .Y(apb_prdata[12])
  );
  AOI22X1 _482_ (
    .A(uart1_prdata[13]),
    .B(uart1_psel),
    .C(wdt_psel),
    .D(wdt_prdata[13]),
    .Y(_150_)
  );
  AOI22X1 _483_ (
    .A(gpio_prdata[13]),
    .B(gpio_psel),
    .C(spi_psel),
    .D(spi_prdata[13]),
    .Y(_151_)
  );
  AOI22X1 _484_ (
    .A(uart0_prdata[13]),
    .B(uart0_psel),
    .C(i2c_psel),
    .D(i2c_prdata[13]),
    .Y(_152_)
  );
  NAND3X1 _485_ (
    .A(_150_),
    .B(_151_),
    .C(_152_),
    .Y(apb_prdata[13])
  );
  AOI22X1 _486_ (
    .A(_032_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_031_),
    .Y(_153_)
  );
  NAND2X1 _487_ (
    .A(_033_),
    .B(spi_psel),
    .Y(_154_)
  );
  OR2X1 _488_ (
    .A(gpio_prdata[14]),
    .B(_076_),
    .Y(_155_)
  );
  NAND3X1 _489_ (
    .A(_153_),
    .B(_154_),
    .C(_155_),
    .Y(_156_)
  );
  NOR2X1 _490_ (
    .A(uart1_prdata[14]),
    .B(_074_),
    .Y(_157_)
  );
  NOR2X1 _491_ (
    .A(uart0_prdata[14]),
    .B(_072_),
    .Y(_158_)
  );
  NOR3X1 _492_ (
    .A(_156_),
    .B(_157_),
    .C(_158_),
    .Y(apb_prdata[14])
  );
  AOI22X1 _493_ (
    .A(_035_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_034_),
    .Y(_159_)
  );
  NAND2X1 _494_ (
    .A(_036_),
    .B(spi_psel),
    .Y(_160_)
  );
  OR2X1 _495_ (
    .A(gpio_prdata[15]),
    .B(_076_),
    .Y(_161_)
  );
  NAND3X1 _496_ (
    .A(_159_),
    .B(_160_),
    .C(_161_),
    .Y(_162_)
  );
  NOR2X1 _497_ (
    .A(uart1_prdata[15]),
    .B(_074_),
    .Y(_163_)
  );
  NOR2X1 _498_ (
    .A(uart0_prdata[15]),
    .B(_072_),
    .Y(_164_)
  );
  NOR3X1 _499_ (
    .A(_162_),
    .B(_163_),
    .C(_164_),
    .Y(apb_prdata[15])
  );
  AOI22X1 _500_ (
    .A(_038_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_037_),
    .Y(_165_)
  );
  NAND2X1 _501_ (
    .A(_039_),
    .B(spi_psel),
    .Y(_166_)
  );
  OR2X1 _502_ (
    .A(gpio_prdata[16]),
    .B(_076_),
    .Y(_167_)
  );
  NAND3X1 _503_ (
    .A(_165_),
    .B(_166_),
    .C(_167_),
    .Y(_168_)
  );
  NOR2X1 _504_ (
    .A(uart1_prdata[16]),
    .B(_074_),
    .Y(_169_)
  );
  NOR2X1 _505_ (
    .A(uart0_prdata[16]),
    .B(_072_),
    .Y(_170_)
  );
  NOR3X1 _506_ (
    .A(_168_),
    .B(_169_),
    .C(_170_),
    .Y(apb_prdata[16])
  );
  AOI22X1 _507_ (
    .A(uart1_prdata[17]),
    .B(uart1_psel),
    .C(wdt_psel),
    .D(wdt_prdata[17]),
    .Y(_171_)
  );
  AOI22X1 _508_ (
    .A(gpio_prdata[17]),
    .B(gpio_psel),
    .C(spi_psel),
    .D(spi_prdata[17]),
    .Y(_172_)
  );
  AOI22X1 _509_ (
    .A(uart0_prdata[17]),
    .B(uart0_psel),
    .C(i2c_psel),
    .D(i2c_prdata[17]),
    .Y(_173_)
  );
  NAND3X1 _510_ (
    .A(_171_),
    .B(_172_),
    .C(_173_),
    .Y(apb_prdata[17])
  );
  AOI22X1 _511_ (
    .A(_041_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_040_),
    .Y(_174_)
  );
  NAND2X1 _512_ (
    .A(_042_),
    .B(spi_psel),
    .Y(_175_)
  );
  OR2X1 _513_ (
    .A(gpio_prdata[18]),
    .B(_076_),
    .Y(_176_)
  );
  NAND3X1 _514_ (
    .A(_174_),
    .B(_175_),
    .C(_176_),
    .Y(_177_)
  );
  NOR2X1 _515_ (
    .A(uart1_prdata[18]),
    .B(_074_),
    .Y(_178_)
  );
  NOR2X1 _516_ (
    .A(uart0_prdata[18]),
    .B(_072_),
    .Y(_179_)
  );
  NOR3X1 _517_ (
    .A(_177_),
    .B(_178_),
    .C(_179_),
    .Y(apb_prdata[18])
  );
  AOI22X1 _518_ (
    .A(_044_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_043_),
    .Y(_180_)
  );
  NAND2X1 _519_ (
    .A(_045_),
    .B(spi_psel),
    .Y(_181_)
  );
  OR2X1 _520_ (
    .A(gpio_prdata[19]),
    .B(_076_),
    .Y(_182_)
  );
  NAND3X1 _521_ (
    .A(_180_),
    .B(_181_),
    .C(_182_),
    .Y(_183_)
  );
  NOR2X1 _522_ (
    .A(uart1_prdata[19]),
    .B(_074_),
    .Y(_184_)
  );
  NOR2X1 _523_ (
    .A(uart0_prdata[19]),
    .B(_072_),
    .Y(_185_)
  );
  NOR3X1 _524_ (
    .A(_183_),
    .B(_184_),
    .C(_185_),
    .Y(apb_prdata[19])
  );
  AOI22X1 _525_ (
    .A(uart1_prdata[20]),
    .B(uart1_psel),
    .C(wdt_psel),
    .D(wdt_prdata[20]),
    .Y(_186_)
  );
  AOI22X1 _526_ (
    .A(gpio_prdata[20]),
    .B(gpio_psel),
    .C(spi_psel),
    .D(spi_prdata[20]),
    .Y(_187_)
  );
  AOI22X1 _527_ (
    .A(uart0_prdata[20]),
    .B(uart0_psel),
    .C(i2c_psel),
    .D(i2c_prdata[20]),
    .Y(_188_)
  );
  NAND3X1 _528_ (
    .A(_186_),
    .B(_187_),
    .C(_188_),
    .Y(apb_prdata[20])
  );
  AOI22X1 _529_ (
    .A(_047_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_046_),
    .Y(_189_)
  );
  NAND2X1 _530_ (
    .A(_048_),
    .B(spi_psel),
    .Y(_190_)
  );
  OR2X1 _531_ (
    .A(gpio_prdata[21]),
    .B(_076_),
    .Y(_191_)
  );
  NAND3X1 _532_ (
    .A(_189_),
    .B(_190_),
    .C(_191_),
    .Y(_192_)
  );
  NOR2X1 _533_ (
    .A(uart1_prdata[21]),
    .B(_074_),
    .Y(_193_)
  );
  NOR2X1 _534_ (
    .A(uart0_prdata[21]),
    .B(_072_),
    .Y(_194_)
  );
  NOR3X1 _535_ (
    .A(_192_),
    .B(_193_),
    .C(_194_),
    .Y(apb_prdata[21])
  );
  AOI22X1 _536_ (
    .A(uart1_prdata[22]),
    .B(uart1_psel),
    .C(wdt_psel),
    .D(wdt_prdata[22]),
    .Y(_195_)
  );
  AOI22X1 _537_ (
    .A(gpio_prdata[22]),
    .B(gpio_psel),
    .C(spi_psel),
    .D(spi_prdata[22]),
    .Y(_196_)
  );
  AOI22X1 _538_ (
    .A(uart0_prdata[22]),
    .B(uart0_psel),
    .C(i2c_psel),
    .D(i2c_prdata[22]),
    .Y(_197_)
  );
  NAND3X1 _539_ (
    .A(_195_),
    .B(_196_),
    .C(_197_),
    .Y(apb_prdata[22])
  );
  AOI22X1 _540_ (
    .A(_050_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_049_),
    .Y(_198_)
  );
  NAND2X1 _541_ (
    .A(_051_),
    .B(spi_psel),
    .Y(_199_)
  );
  OR2X1 _542_ (
    .A(gpio_prdata[23]),
    .B(_076_),
    .Y(_200_)
  );
  NAND3X1 _543_ (
    .A(_198_),
    .B(_199_),
    .C(_200_),
    .Y(_201_)
  );
  NOR2X1 _544_ (
    .A(uart1_prdata[23]),
    .B(_074_),
    .Y(_202_)
  );
  NOR2X1 _545_ (
    .A(uart0_prdata[23]),
    .B(_072_),
    .Y(_203_)
  );
  NOR3X1 _546_ (
    .A(_201_),
    .B(_202_),
    .C(_203_),
    .Y(apb_prdata[23])
  );
  AOI22X1 _547_ (
    .A(uart1_prdata[24]),
    .B(uart1_psel),
    .C(wdt_psel),
    .D(wdt_prdata[24]),
    .Y(_204_)
  );
  AOI22X1 _548_ (
    .A(gpio_prdata[24]),
    .B(gpio_psel),
    .C(spi_psel),
    .D(spi_prdata[24]),
    .Y(_205_)
  );
  AOI22X1 _549_ (
    .A(uart0_prdata[24]),
    .B(uart0_psel),
    .C(i2c_psel),
    .D(i2c_prdata[24]),
    .Y(_206_)
  );
  NAND3X1 _550_ (
    .A(_204_),
    .B(_205_),
    .C(_206_),
    .Y(apb_prdata[24])
  );
  AOI22X1 _551_ (
    .A(_053_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_052_),
    .Y(_207_)
  );
  NAND2X1 _552_ (
    .A(_054_),
    .B(spi_psel),
    .Y(_208_)
  );
  OR2X1 _553_ (
    .A(gpio_prdata[25]),
    .B(_076_),
    .Y(_209_)
  );
  NAND3X1 _554_ (
    .A(_207_),
    .B(_208_),
    .C(_209_),
    .Y(_210_)
  );
  NOR2X1 _555_ (
    .A(uart1_prdata[25]),
    .B(_074_),
    .Y(_211_)
  );
  NOR2X1 _556_ (
    .A(uart0_prdata[25]),
    .B(_072_),
    .Y(_212_)
  );
  NOR3X1 _557_ (
    .A(_210_),
    .B(_211_),
    .C(_212_),
    .Y(apb_prdata[25])
  );
  AOI22X1 _558_ (
    .A(_056_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_055_),
    .Y(_213_)
  );
  NAND2X1 _559_ (
    .A(_057_),
    .B(spi_psel),
    .Y(_214_)
  );
  OR2X1 _560_ (
    .A(gpio_prdata[26]),
    .B(_076_),
    .Y(_215_)
  );
  NAND3X1 _561_ (
    .A(_213_),
    .B(_214_),
    .C(_215_),
    .Y(_216_)
  );
  NOR2X1 _562_ (
    .A(uart1_prdata[26]),
    .B(_074_),
    .Y(_217_)
  );
  NOR2X1 _563_ (
    .A(uart0_prdata[26]),
    .B(_072_),
    .Y(_218_)
  );
  NOR3X1 _564_ (
    .A(_216_),
    .B(_217_),
    .C(_218_),
    .Y(apb_prdata[26])
  );
  AOI22X1 _565_ (
    .A(_059_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_058_),
    .Y(_219_)
  );
  NAND2X1 _566_ (
    .A(_060_),
    .B(spi_psel),
    .Y(_220_)
  );
  OR2X1 _567_ (
    .A(gpio_prdata[27]),
    .B(_076_),
    .Y(_221_)
  );
  NAND3X1 _568_ (
    .A(_219_),
    .B(_220_),
    .C(_221_),
    .Y(_222_)
  );
  NOR2X1 _569_ (
    .A(uart1_prdata[27]),
    .B(_074_),
    .Y(_223_)
  );
  NOR2X1 _570_ (
    .A(uart0_prdata[27]),
    .B(_072_),
    .Y(_224_)
  );
  NOR3X1 _571_ (
    .A(_222_),
    .B(_223_),
    .C(_224_),
    .Y(apb_prdata[27])
  );
  AOI22X1 _572_ (
    .A(_062_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_061_),
    .Y(_225_)
  );
  NAND2X1 _573_ (
    .A(_063_),
    .B(spi_psel),
    .Y(_226_)
  );
  OR2X1 _574_ (
    .A(gpio_prdata[28]),
    .B(_076_),
    .Y(_227_)
  );
  NAND3X1 _575_ (
    .A(_225_),
    .B(_226_),
    .C(_227_),
    .Y(_228_)
  );
  NOR2X1 _576_ (
    .A(uart1_prdata[28]),
    .B(_074_),
    .Y(_229_)
  );
  NOR2X1 _577_ (
    .A(uart0_prdata[28]),
    .B(_072_),
    .Y(_230_)
  );
  NOR3X1 _578_ (
    .A(_228_),
    .B(_229_),
    .C(_230_),
    .Y(apb_prdata[28])
  );
  AOI22X1 _579_ (
    .A(uart1_prdata[29]),
    .B(uart1_psel),
    .C(wdt_psel),
    .D(wdt_prdata[29]),
    .Y(_231_)
  );
  AOI22X1 _580_ (
    .A(gpio_prdata[29]),
    .B(gpio_psel),
    .C(spi_psel),
    .D(spi_prdata[29]),
    .Y(_232_)
  );
  AOI22X1 _581_ (
    .A(uart0_prdata[29]),
    .B(uart0_psel),
    .C(i2c_psel),
    .D(i2c_prdata[29]),
    .Y(_233_)
  );
  NAND3X1 _582_ (
    .A(_231_),
    .B(_232_),
    .C(_233_),
    .Y(apb_prdata[29])
  );
  AOI22X1 _583_ (
    .A(_065_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_064_),
    .Y(_234_)
  );
  NAND2X1 _584_ (
    .A(_066_),
    .B(spi_psel),
    .Y(_235_)
  );
  OR2X1 _585_ (
    .A(gpio_prdata[30]),
    .B(_076_),
    .Y(_236_)
  );
  NAND3X1 _586_ (
    .A(_234_),
    .B(_235_),
    .C(_236_),
    .Y(_237_)
  );
  NOR2X1 _587_ (
    .A(uart1_prdata[30]),
    .B(_074_),
    .Y(_238_)
  );
  NOR2X1 _588_ (
    .A(uart0_prdata[30]),
    .B(_072_),
    .Y(_239_)
  );
  NOR3X1 _589_ (
    .A(_237_),
    .B(_238_),
    .C(_239_),
    .Y(apb_prdata[30])
  );
  AOI22X1 _590_ (
    .A(_068_),
    .B(i2c_psel),
    .C(wdt_psel),
    .D(_067_),
    .Y(_240_)
  );
  NAND2X1 _591_ (
    .A(_069_),
    .B(spi_psel),
    .Y(_241_)
  );
  OR2X1 _592_ (
    .A(gpio_prdata[31]),
    .B(_076_),
    .Y(_242_)
  );
  NAND3X1 _593_ (
    .A(_240_),
    .B(_241_),
    .C(_242_),
    .Y(_243_)
  );
  NOR2X1 _594_ (
    .A(uart1_prdata[31]),
    .B(_074_),
    .Y(_244_)
  );
  NOR2X1 _595_ (
    .A(uart0_prdata[31]),
    .B(_072_),
    .Y(_245_)
  );
  NOR3X1 _596_ (
    .A(_243_),
    .B(_244_),
    .C(_245_),
    .Y(apb_prdata[31])
  );
  MUX2X1 _597_ (
    .A(sha_prdata[0]),
    .B(trng_prdata[0]),
    .S(sha_psel),
    .Y(_246_)
  );
  NAND2X1 _598_ (
    .A(aes_prdata[0]),
    .B(aes_psel),
    .Y(_247_)
  );
  OAI21X1 _599_ (
    .A(aes_psel),
    .B(_246_),
    .C(_247_),
    .Y(s7_rdata_x[0])
  );
  MUX2X1 _600_ (
    .A(sha_prdata[1]),
    .B(trng_prdata[1]),
    .S(sha_psel),
    .Y(_248_)
  );
  NAND2X1 _601_ (
    .A(aes_prdata[1]),
    .B(aes_psel),
    .Y(_249_)
  );
  OAI21X1 _602_ (
    .A(aes_psel),
    .B(_248_),
    .C(_249_),
    .Y(s7_rdata_x[1])
  );
  MUX2X1 _603_ (
    .A(sha_prdata[2]),
    .B(trng_prdata[2]),
    .S(sha_psel),
    .Y(_250_)
  );
  NAND2X1 _604_ (
    .A(aes_prdata[2]),
    .B(aes_psel),
    .Y(_251_)
  );
  OAI21X1 _605_ (
    .A(aes_psel),
    .B(_250_),
    .C(_251_),
    .Y(s7_rdata_x[2])
  );
  MUX2X1 _606_ (
    .A(sha_prdata[3]),
    .B(trng_prdata[3]),
    .S(sha_psel),
    .Y(_252_)
  );
  NAND2X1 _607_ (
    .A(aes_prdata[3]),
    .B(aes_psel),
    .Y(_253_)
  );
  OAI21X1 _608_ (
    .A(aes_psel),
    .B(_252_),
    .C(_253_),
    .Y(s7_rdata_x[3])
  );
  MUX2X1 _609_ (
    .A(sha_prdata[4]),
    .B(trng_prdata[4]),
    .S(sha_psel),
    .Y(_254_)
  );
  NAND2X1 _610_ (
    .A(aes_prdata[4]),
    .B(aes_psel),
    .Y(_255_)
  );
  OAI21X1 _611_ (
    .A(aes_psel),
    .B(_254_),
    .C(_255_),
    .Y(s7_rdata_x[4])
  );
  MUX2X1 _612_ (
    .A(sha_prdata[5]),
    .B(trng_prdata[5]),
    .S(sha_psel),
    .Y(_256_)
  );
  NAND2X1 _613_ (
    .A(aes_prdata[5]),
    .B(aes_psel),
    .Y(_257_)
  );
  OAI21X1 _614_ (
    .A(aes_psel),
    .B(_256_),
    .C(_257_),
    .Y(s7_rdata_x[5])
  );
  MUX2X1 _615_ (
    .A(sha_prdata[6]),
    .B(trng_prdata[6]),
    .S(sha_psel),
    .Y(_258_)
  );
  NAND2X1 _616_ (
    .A(aes_prdata[6]),
    .B(aes_psel),
    .Y(_259_)
  );
  OAI21X1 _617_ (
    .A(aes_psel),
    .B(_258_),
    .C(_259_),
    .Y(s7_rdata_x[6])
  );
  MUX2X1 _618_ (
    .A(sha_prdata[7]),
    .B(trng_prdata[7]),
    .S(sha_psel),
    .Y(_260_)
  );
  NAND2X1 _619_ (
    .A(aes_prdata[7]),
    .B(aes_psel),
    .Y(_261_)
  );
  OAI21X1 _620_ (
    .A(aes_psel),
    .B(_260_),
    .C(_261_),
    .Y(s7_rdata_x[7])
  );
  MUX2X1 _621_ (
    .A(sha_prdata[8]),
    .B(trng_prdata[8]),
    .S(sha_psel),
    .Y(_262_)
  );
  NAND2X1 _622_ (
    .A(aes_prdata[8]),
    .B(aes_psel),
    .Y(_263_)
  );
  OAI21X1 _623_ (
    .A(aes_psel),
    .B(_262_),
    .C(_263_),
    .Y(s7_rdata_x[8])
  );
  MUX2X1 _624_ (
    .A(sha_prdata[9]),
    .B(trng_prdata[9]),
    .S(sha_psel),
    .Y(_264_)
  );
  NAND2X1 _625_ (
    .A(aes_prdata[9]),
    .B(aes_psel),
    .Y(_265_)
  );
  OAI21X1 _626_ (
    .A(aes_psel),
    .B(_264_),
    .C(_265_),
    .Y(s7_rdata_x[9])
  );
  MUX2X1 _627_ (
    .A(sha_prdata[10]),
    .B(trng_prdata[10]),
    .S(sha_psel),
    .Y(_266_)
  );
  NAND2X1 _628_ (
    .A(aes_prdata[10]),
    .B(aes_psel),
    .Y(_267_)
  );
  OAI21X1 _629_ (
    .A(aes_psel),
    .B(_266_),
    .C(_267_),
    .Y(s7_rdata_x[10])
  );
  MUX2X1 _630_ (
    .A(sha_prdata[11]),
    .B(trng_prdata[11]),
    .S(sha_psel),
    .Y(_268_)
  );
  NAND2X1 _631_ (
    .A(aes_prdata[11]),
    .B(aes_psel),
    .Y(_269_)
  );
  OAI21X1 _632_ (
    .A(aes_psel),
    .B(_268_),
    .C(_269_),
    .Y(s7_rdata_x[11])
  );
  MUX2X1 _633_ (
    .A(sha_prdata[12]),
    .B(trng_prdata[12]),
    .S(sha_psel),
    .Y(_270_)
  );
  NAND2X1 _634_ (
    .A(aes_prdata[12]),
    .B(aes_psel),
    .Y(_271_)
  );
  OAI21X1 _635_ (
    .A(aes_psel),
    .B(_270_),
    .C(_271_),
    .Y(s7_rdata_x[12])
  );
  MUX2X1 _636_ (
    .A(sha_prdata[13]),
    .B(trng_prdata[13]),
    .S(sha_psel),
    .Y(_272_)
  );
  NAND2X1 _637_ (
    .A(aes_prdata[13]),
    .B(aes_psel),
    .Y(_273_)
  );
  OAI21X1 _638_ (
    .A(aes_psel),
    .B(_272_),
    .C(_273_),
    .Y(s7_rdata_x[13])
  );
  MUX2X1 _639_ (
    .A(sha_prdata[14]),
    .B(trng_prdata[14]),
    .S(sha_psel),
    .Y(_274_)
  );
  NAND2X1 _640_ (
    .A(aes_prdata[14]),
    .B(aes_psel),
    .Y(_275_)
  );
  OAI21X1 _641_ (
    .A(aes_psel),
    .B(_274_),
    .C(_275_),
    .Y(s7_rdata_x[14])
  );
  MUX2X1 _642_ (
    .A(sha_prdata[15]),
    .B(trng_prdata[15]),
    .S(sha_psel),
    .Y(_276_)
  );
  NAND2X1 _643_ (
    .A(aes_prdata[15]),
    .B(aes_psel),
    .Y(_277_)
  );
  OAI21X1 _644_ (
    .A(aes_psel),
    .B(_276_),
    .C(_277_),
    .Y(s7_rdata_x[15])
  );
  MUX2X1 _645_ (
    .A(sha_prdata[16]),
    .B(trng_prdata[16]),
    .S(sha_psel),
    .Y(_278_)
  );
  NAND2X1 _646_ (
    .A(aes_prdata[16]),
    .B(aes_psel),
    .Y(_279_)
  );
  OAI21X1 _647_ (
    .A(aes_psel),
    .B(_278_),
    .C(_279_),
    .Y(s7_rdata_x[16])
  );
  MUX2X1 _648_ (
    .A(sha_prdata[17]),
    .B(trng_prdata[17]),
    .S(sha_psel),
    .Y(_280_)
  );
  NAND2X1 _649_ (
    .A(aes_prdata[17]),
    .B(aes_psel),
    .Y(_281_)
  );
  OAI21X1 _650_ (
    .A(aes_psel),
    .B(_280_),
    .C(_281_),
    .Y(s7_rdata_x[17])
  );
  MUX2X1 _651_ (
    .A(sha_prdata[18]),
    .B(trng_prdata[18]),
    .S(sha_psel),
    .Y(_282_)
  );
  NAND2X1 _652_ (
    .A(aes_prdata[18]),
    .B(aes_psel),
    .Y(_283_)
  );
  OAI21X1 _653_ (
    .A(aes_psel),
    .B(_282_),
    .C(_283_),
    .Y(s7_rdata_x[18])
  );
  MUX2X1 _654_ (
    .A(sha_prdata[19]),
    .B(trng_prdata[19]),
    .S(sha_psel),
    .Y(_284_)
  );
  NAND2X1 _655_ (
    .A(aes_prdata[19]),
    .B(aes_psel),
    .Y(_285_)
  );
  OAI21X1 _656_ (
    .A(aes_psel),
    .B(_284_),
    .C(_285_),
    .Y(s7_rdata_x[19])
  );
  MUX2X1 _657_ (
    .A(sha_prdata[20]),
    .B(trng_prdata[20]),
    .S(sha_psel),
    .Y(_286_)
  );
  NAND2X1 _658_ (
    .A(aes_prdata[20]),
    .B(aes_psel),
    .Y(_287_)
  );
  OAI21X1 _659_ (
    .A(aes_psel),
    .B(_286_),
    .C(_287_),
    .Y(s7_rdata_x[20])
  );
  MUX2X1 _660_ (
    .A(sha_prdata[21]),
    .B(trng_prdata[21]),
    .S(sha_psel),
    .Y(_288_)
  );
  NAND2X1 _661_ (
    .A(aes_prdata[21]),
    .B(aes_psel),
    .Y(_289_)
  );
  OAI21X1 _662_ (
    .A(aes_psel),
    .B(_288_),
    .C(_289_),
    .Y(s7_rdata_x[21])
  );
  MUX2X1 _663_ (
    .A(sha_prdata[22]),
    .B(trng_prdata[22]),
    .S(sha_psel),
    .Y(_290_)
  );
  NAND2X1 _664_ (
    .A(aes_prdata[22]),
    .B(aes_psel),
    .Y(_291_)
  );
  OAI21X1 _665_ (
    .A(aes_psel),
    .B(_290_),
    .C(_291_),
    .Y(s7_rdata_x[22])
  );
  MUX2X1 _666_ (
    .A(sha_prdata[23]),
    .B(trng_prdata[23]),
    .S(sha_psel),
    .Y(_292_)
  );
  NAND2X1 _667_ (
    .A(aes_prdata[23]),
    .B(aes_psel),
    .Y(_293_)
  );
  OAI21X1 _668_ (
    .A(aes_psel),
    .B(_292_),
    .C(_293_),
    .Y(s7_rdata_x[23])
  );
  MUX2X1 _669_ (
    .A(sha_prdata[24]),
    .B(trng_prdata[24]),
    .S(sha_psel),
    .Y(_294_)
  );
  NAND2X1 _670_ (
    .A(aes_prdata[24]),
    .B(aes_psel),
    .Y(_295_)
  );
  OAI21X1 _671_ (
    .A(aes_psel),
    .B(_294_),
    .C(_295_),
    .Y(s7_rdata_x[24])
  );
  MUX2X1 _672_ (
    .A(sha_prdata[25]),
    .B(trng_prdata[25]),
    .S(sha_psel),
    .Y(_296_)
  );
  NAND2X1 _673_ (
    .A(aes_prdata[25]),
    .B(aes_psel),
    .Y(_297_)
  );
  OAI21X1 _674_ (
    .A(aes_psel),
    .B(_296_),
    .C(_297_),
    .Y(s7_rdata_x[25])
  );
  MUX2X1 _675_ (
    .A(sha_prdata[26]),
    .B(trng_prdata[26]),
    .S(sha_psel),
    .Y(_298_)
  );
  NAND2X1 _676_ (
    .A(aes_prdata[26]),
    .B(aes_psel),
    .Y(_299_)
  );
  OAI21X1 _677_ (
    .A(aes_psel),
    .B(_298_),
    .C(_299_),
    .Y(s7_rdata_x[26])
  );
  MUX2X1 _678_ (
    .A(sha_prdata[27]),
    .B(trng_prdata[27]),
    .S(sha_psel),
    .Y(_300_)
  );
  NAND2X1 _679_ (
    .A(aes_prdata[27]),
    .B(aes_psel),
    .Y(_301_)
  );
  OAI21X1 _680_ (
    .A(aes_psel),
    .B(_300_),
    .C(_301_),
    .Y(s7_rdata_x[27])
  );
  MUX2X1 _681_ (
    .A(sha_prdata[28]),
    .B(trng_prdata[28]),
    .S(sha_psel),
    .Y(_302_)
  );
  NAND2X1 _682_ (
    .A(aes_prdata[28]),
    .B(aes_psel),
    .Y(_303_)
  );
  OAI21X1 _683_ (
    .A(aes_psel),
    .B(_302_),
    .C(_303_),
    .Y(s7_rdata_x[28])
  );
  MUX2X1 _684_ (
    .A(sha_prdata[29]),
    .B(trng_prdata[29]),
    .S(sha_psel),
    .Y(_304_)
  );
  NAND2X1 _685_ (
    .A(aes_prdata[29]),
    .B(aes_psel),
    .Y(_305_)
  );
  OAI21X1 _686_ (
    .A(aes_psel),
    .B(_304_),
    .C(_305_),
    .Y(s7_rdata_x[29])
  );
  MUX2X1 _687_ (
    .A(sha_prdata[30]),
    .B(trng_prdata[30]),
    .S(sha_psel),
    .Y(_306_)
  );
  NAND2X1 _688_ (
    .A(aes_prdata[30]),
    .B(aes_psel),
    .Y(_307_)
  );
  OAI21X1 _689_ (
    .A(aes_psel),
    .B(_306_),
    .C(_307_),
    .Y(s7_rdata_x[30])
  );
  MUX2X1 _690_ (
    .A(sha_prdata[31]),
    .B(trng_prdata[31]),
    .S(sha_psel),
    .Y(_308_)
  );
  NAND2X1 _691_ (
    .A(aes_prdata[31]),
    .B(aes_psel),
    .Y(_309_)
  );
  OAI21X1 _692_ (
    .A(aes_psel),
    .B(_308_),
    .C(_309_),
    .Y(s7_rdata_x[31])
  );
  aes_engine u_aes (
    .clk(sys_clk),
    .irq(aes_irq),
    .paddr(s7_araddr_x[5:0]),
    .penable(1'h1),
    .prdata(aes_prdata),
    .psel(aes_psel),
    .pwdata(s7_wdata_x[31:0]),
    .pwrite(s7_awvalid_x),
    .rst_n(sync_rst_n)
  );
  ahb_to_apb u_ahb2apb (
    .clk(sys_clk),
    .haddr(ahb_haddr),
    .hrdata(ahb_hrdata),
    .hready_out(ahb_hready),
    .hresp(ahb_hresp),
    .htrans(ahb_htrans),
    .hwdata(ahb_hwdata),
    .hwrite(ahb_hwrite),
    .paddr(apb_paddr),
    .penable(apb_penable),
    .prdata(apb_prdata),
    .pready(1'hx),
    .psel(apb_psel),
    .pslverr(1'h0),
    .pwdata(apb_pwdata),
    .pwrite(apb_pwrite),
    .rst_n(sync_rst_n)
  );
  axi4_to_ahb  u_axi2ahb (
    .clk(sys_clk),
    .haddr(ahb_haddr),
    .hrdata(ahb_hrdata),
    .hready(ahb_hready),
    .hresp(ahb_hresp),
    .htrans(ahb_htrans),
    .hwdata(ahb_hwdata),
    .hwrite(ahb_hwrite),
    .rst_n(sync_rst_n),
    .s_araddr(s6_araddr_x),
    .s_arid(4'h0),
    .s_arready(s6_arready_x),
    .s_arvalid(s6_arvalid_x),
    .s_awaddr(s6_awaddr_x),
    .s_awid(4'h0),
    .s_awready(s6_awready_x),
    .s_awvalid(s6_awvalid_x),
    .s_bready(s6_bready_x),
    .s_bvalid(s6_bvalid_x),
    .s_rdata(s6_rdata_x),
    .s_rready(s6_rready_x),
    .s_rvalid(s6_rvalid_x),
    .s_wdata(s6_wdata_x[31:0]),
    .s_wready(s6_wready_x),
    .s_wstrb(s6_wstrb_x[3:0]),
    .s_wvalid(s6_wvalid_x)
  );
  cpu_complex_top u_cpu_complex (
    .clk(sys_clk),
    .cpu0_dmem_araddr(cpu0_dmem_araddr),
    .cpu0_dmem_arready(cpu0_dmem_arready),
    .cpu0_dmem_arvalid(cpu0_dmem_arvalid),
    .cpu0_dmem_awaddr(cpu0_dmem_awaddr),
    .cpu0_dmem_awready(cpu0_dmem_awready),
    .cpu0_dmem_awvalid(cpu0_dmem_awvalid),
    .cpu0_dmem_bready(cpu0_dmem_bready),
    .cpu0_dmem_bvalid(cpu0_dmem_bvalid),
    .cpu0_dmem_rdata(cpu0_dmem_rdata),
    .cpu0_dmem_rready(cpu0_dmem_rready),
    .cpu0_dmem_rresp(cpu0_dmem_rresp),
    .cpu0_dmem_rvalid(cpu0_dmem_rvalid),
    .cpu0_dmem_wdata(cpu0_dmem_wdata),
    .cpu0_dmem_wready(cpu0_dmem_wready),
    .cpu0_dmem_wstrb(cpu0_dmem_wstrb),
    .cpu0_dmem_wvalid(cpu0_dmem_wvalid),
    .cpu0_imem_araddr(cpu0_imem_araddr),
    .cpu0_imem_arready(1'h1),
    .cpu0_imem_arvalid(cpu0_imem_arvalid),
    .cpu0_imem_rdata(64'h0000000000000013),
    .cpu0_imem_rresp(2'h0),
    .cpu0_imem_rvalid(cpu0_imem_arvalid),
    .cpu1_dmem_araddr(cpu1_dmem_araddr),
    .cpu1_dmem_arready(cpu1_dmem_arready),
    .cpu1_dmem_arvalid(cpu1_dmem_arvalid),
    .cpu1_dmem_awaddr(cpu1_dmem_awaddr),
    .cpu1_dmem_awready(cpu1_dmem_awready),
    .cpu1_dmem_awvalid(cpu1_dmem_awvalid),
    .cpu1_dmem_bready(cpu1_dmem_bready),
    .cpu1_dmem_bvalid(cpu1_dmem_bvalid),
    .cpu1_dmem_rdata(cpu1_dmem_rdata),
    .cpu1_dmem_rready(cpu1_dmem_rready),
    .cpu1_dmem_rresp(cpu1_dmem_rresp),
    .cpu1_dmem_rvalid(cpu1_dmem_rvalid),
    .cpu1_dmem_wdata(cpu1_dmem_wdata),
    .cpu1_dmem_wready(cpu1_dmem_wready),
    .cpu1_dmem_wstrb(cpu1_dmem_wstrb),
    .cpu1_dmem_wvalid(cpu1_dmem_wvalid),
    .cpu1_imem_araddr(cpu1_imem_araddr),
    .cpu1_imem_arready(1'h1),
    .cpu1_imem_arvalid(cpu1_imem_arvalid),
    .cpu1_imem_rdata(64'h0000000000000013),
    .cpu1_imem_rresp(2'h0),
    .cpu1_imem_rvalid(cpu1_imem_arvalid),
    .cpu2_dmem_araddr(cpu2_dmem_araddr),
    .cpu2_dmem_arready(cpu2_dmem_arready),
    .cpu2_dmem_arvalid(cpu2_dmem_arvalid),
    .cpu2_dmem_awaddr(cpu2_dmem_awaddr),
    .cpu2_dmem_awready(cpu2_dmem_awready),
    .cpu2_dmem_awvalid(cpu2_dmem_awvalid),
    .cpu2_dmem_bready(cpu2_dmem_bready),
    .cpu2_dmem_bvalid(cpu2_dmem_bvalid),
    .cpu2_dmem_rdata(cpu2_dmem_rdata),
    .cpu2_dmem_rready(cpu2_dmem_rready),
    .cpu2_dmem_rresp(cpu2_dmem_rresp),
    .cpu2_dmem_rvalid(cpu2_dmem_rvalid),
    .cpu2_dmem_wdata(cpu2_dmem_wdata),
    .cpu2_dmem_wready(cpu2_dmem_wready),
    .cpu2_dmem_wstrb(cpu2_dmem_wstrb),
    .cpu2_dmem_wvalid(cpu2_dmem_wvalid),
    .cpu2_imem_araddr(cpu2_imem_araddr),
    .cpu2_imem_arready(1'h1),
    .cpu2_imem_arvalid(cpu2_imem_arvalid),
    .cpu2_imem_rdata(64'h0000000000000013),
    .cpu2_imem_rresp(2'h0),
    .cpu2_imem_rvalid(cpu2_imem_arvalid),
    .cpu3_dmem_araddr(cpu3_dmem_araddr),
    .cpu3_dmem_arready(cpu3_dmem_arready),
    .cpu3_dmem_arvalid(cpu3_dmem_arvalid),
    .cpu3_dmem_awaddr(cpu3_dmem_awaddr),
    .cpu3_dmem_awready(cpu3_dmem_awready),
    .cpu3_dmem_awvalid(cpu3_dmem_awvalid),
    .cpu3_dmem_bready(cpu3_dmem_bready),
    .cpu3_dmem_bvalid(cpu3_dmem_bvalid),
    .cpu3_dmem_rdata(cpu3_dmem_rdata),
    .cpu3_dmem_rready(cpu3_dmem_rready),
    .cpu3_dmem_rresp(cpu3_dmem_rresp),
    .cpu3_dmem_rvalid(cpu3_dmem_rvalid),
    .cpu3_dmem_wdata(cpu3_dmem_wdata),
    .cpu3_dmem_wready(cpu3_dmem_wready),
    .cpu3_dmem_wstrb(cpu3_dmem_wstrb),
    .cpu3_dmem_wvalid(cpu3_dmem_wvalid),
    .cpu3_imem_araddr(cpu3_imem_araddr),
    .cpu3_imem_arready(1'h1),
    .cpu3_imem_arvalid(cpu3_imem_arvalid),
    .cpu3_imem_rdata(64'h0000000000000013),
    .cpu3_imem_rresp(2'h0),
    .cpu3_imem_rvalid(cpu3_imem_arvalid),
    .cpu4_dmem_araddr(cpu4_dmem_araddr),
    .cpu4_dmem_arready(cpu4_dmem_arready),
    .cpu4_dmem_arvalid(cpu4_dmem_arvalid),
    .cpu4_dmem_awaddr(cpu4_dmem_awaddr),
    .cpu4_dmem_awready(cpu4_dmem_awready),
    .cpu4_dmem_awvalid(cpu4_dmem_awvalid),
    .cpu4_dmem_bready(cpu4_dmem_bready),
    .cpu4_dmem_bvalid(cpu4_dmem_bvalid),
    .cpu4_dmem_rdata(cpu4_dmem_rdata),
    .cpu4_dmem_rready(cpu4_dmem_rready),
    .cpu4_dmem_rresp(cpu4_dmem_rresp),
    .cpu4_dmem_rvalid(cpu4_dmem_rvalid),
    .cpu4_dmem_wdata(cpu4_dmem_wdata),
    .cpu4_dmem_wready(cpu4_dmem_wready),
    .cpu4_dmem_wstrb(cpu4_dmem_wstrb),
    .cpu4_dmem_wvalid(cpu4_dmem_wvalid),
    .cpu4_imem_araddr(cpu4_imem_araddr),
    .cpu4_imem_arready(1'h1),
    .cpu4_imem_arvalid(cpu4_imem_arvalid),
    .cpu4_imem_rdata(64'h0000000000000013),
    .cpu4_imem_rresp(2'h0),
    .cpu4_imem_rvalid(cpu4_imem_arvalid),
    .harts_active(harts_active),
    .irq_sources({ 167'h000000000000000000000000000000000000000000, pcie_irq, gem1_irq, gem0_irq, trng_irq, sha_irq, aes_irq, wdt_irq, i2c_irq, spi_irq, gpio_irq, uart1_irq, uart0_irq, 7'h00 }),
    .rst_n(sync_rst_n)
  );
  ddr_ctrl_top u_ddr (
    .clk(sys_clk),
    .ddr_addr(ddr_addr),
    .ddr_ba(ddr_ba),
    .ddr_cas_n(ddr_cas_n),
    .ddr_ck_n(ddr_ck_n),
    .ddr_ck_p(ddr_ck_p),
    .ddr_cke(ddr_cke),
    .ddr_cs_n(ddr_cs_n),
    .ddr_dm(ddr_dm),
    .ddr_dq(ddr_dq),
    .ddr_dqs_n(ddr_dqs_n),
    .ddr_dqs_p(ddr_dqs_p),
    .ddr_ras_n(ddr_ras_n),
    .ddr_we_n(ddr_we_n),
    .rst_n(sync_rst_n),
    .s_araddr(ddr_s_araddr),
    .s_arid(ddr_s_arid),
    .s_arlen(ddr_s_arlen),
    .s_arready(ddr_s_arready),
    .s_arvalid(ddr_s_arvalid),
    .s_awaddr(ddr_s_awaddr),
    .s_awid(ddr_s_awid),
    .s_awlen(ddr_s_awlen),
    .s_awready(ddr_s_awready),
    .s_awsize(ddr_s_awsize),
    .s_awvalid(ddr_s_awvalid),
    .s_bid(ddr_s_bid),
    .s_bready(ddr_s_bready),
    .s_bresp(ddr_s_bresp),
    .s_bvalid(ddr_s_bvalid),
    .s_rdata(ddr_s_rdata),
    .s_rid(ddr_s_rid),
    .s_rlast(ddr_s_rlast),
    .s_rready(ddr_s_rready),
    .s_rresp(ddr_s_rresp),
    .s_rvalid(ddr_s_rvalid),
    .s_wdata(ddr_s_wdata),
    .s_wlast(ddr_s_wlast),
    .s_wready(ddr_s_wready),
    .s_wstrb(ddr_s_wstrb),
    .s_wvalid(ddr_s_wvalid)
  );
  gem_ethernet u_gem0 (
    .clk(eth_clk),
    .irq(gem0_irq),
    .m_arready(1'h1),
    .m_arvalid(gem0_m_arvalid),
    .m_awready(1'h1),
    .m_awvalid(gem0_m_awvalid),
    .m_bvalid(1'h0),
    .m_rdata(64'h0000000000000000),
    .m_rvalid(1'h0),
    .m_wready(1'h1),
    .m_wvalid(gem0_m_wvalid),
    .rgmii_rx_ctl(gem0_rgmii_rx_ctl),
    .rgmii_rxc(gem0_rgmii_rxc),
    .rgmii_rxd(gem0_rgmii_rxd),
    .rgmii_tx_ctl(gem0_rgmii_tx_ctl),
    .rgmii_txc(gem0_rgmii_txc),
    .rgmii_txd(gem0_rgmii_txd),
    .rst_n(sync_rst_n),
    .s_araddr(s3_araddr_x[15:0]),
    .s_arready(s3_arready_x),
    .s_arvalid(s3_arvalid_x),
    .s_awaddr(s3_awaddr_x[15:0]),
    .s_awready(s3_awready_x),
    .s_awvalid(s3_awvalid_x),
    .s_bready(s3_bready_x),
    .s_bvalid(s3_bvalid_x),
    .s_rdata(s3_rdata_x),
    .s_rready(s3_rready_x),
    .s_rvalid(s3_rvalid_x),
    .s_wdata(s3_wdata_x[31:0]),
    .s_wready(s3_wready_x),
    .s_wstrb(s3_wstrb_x[3:0]),
    .s_wvalid(s3_wvalid_x)
  );
  gem_ethernet u_gem1 (
    .clk(eth_clk),
    .irq(gem1_irq),
    .m_arready(1'h1),
    .m_arvalid(gem1_m_arvalid_w),
    .m_awready(1'h1),
    .m_awvalid(gem1_m_awvalid_w),
    .m_bvalid(1'h0),
    .m_rdata(64'h0000000000000000),
    .m_rvalid(1'h0),
    .m_wready(1'h1),
    .m_wvalid(gem1_m_wvalid_w),
    .rgmii_rx_ctl(gem1_rgmii_rx_ctl),
    .rgmii_rxc(gem1_rgmii_rxc),
    .rgmii_rxd(gem1_rgmii_rxd),
    .rgmii_tx_ctl(gem1_rgmii_tx_ctl),
    .rgmii_txc(gem1_rgmii_txc),
    .rgmii_txd(gem1_rgmii_txd),
    .rst_n(sync_rst_n),
    .s_araddr(s4_araddr_x[15:0]),
    .s_arready(s4_arready_x),
    .s_arvalid(s4_arvalid_x),
    .s_awaddr(s4_awaddr_x[15:0]),
    .s_awready(s4_awready_x),
    .s_awvalid(s4_awvalid_x),
    .s_bready(s4_bready_x),
    .s_bvalid(s4_bvalid_x),
    .s_rdata(s4_rdata_x[31:0]),
    .s_rready(s4_rready_x),
    .s_rvalid(s4_rvalid_x),
    .s_wdata(s4_wdata_x[31:0]),
    .s_wready(s4_wready_x),
    .s_wstrb(s4_wstrb_x[3:0]),
    .s_wvalid(s4_wvalid_x)
  );
  gpio_ctrl u_gpio (
    .clk(sys_clk),
    .gpio_pad(gpio_pad),
    .irq(gpio_irq),
    .paddr(apb_paddr[3:0]),
    .penable(apb_penable),
    .prdata(gpio_prdata),
    .pready(gpio_pready),
    .psel(gpio_psel),
    .pwdata(apb_pwdata),
    .pwrite(apb_pwrite),
    .rst_n(sync_rst_n)
  );
  i2c_master u_i2c (
    .clk(sys_clk),
    .irq(i2c_irq),
    .paddr(apb_paddr[3:0]),
    .penable(apb_penable),
    .prdata(i2c_prdata),
    .pready(i2c_pready),
    .psel(i2c_psel),
    .pwdata(apb_pwdata),
    .pwrite(apb_pwrite),
    .rst_n(sync_rst_n),
    .scl_pad(i2c_scl),
    .sda_pad(i2c_sda)
  );
  l2_cache_top u_l2_cache (
    .clk(sys_clk),
    .m_araddr(ddr_s_araddr),
    .m_arready(ddr_s_arready),
    .m_arvalid(ddr_s_arvalid),
    .m_awaddr(ddr_s_awaddr),
    .m_awready(ddr_s_awready),
    .m_awvalid(ddr_s_awvalid),
    .m_bready(ddr_s_bready),
    .m_bvalid(ddr_s_bvalid),
    .m_rdata(ddr_s_rdata),
    .m_rready(ddr_s_rready),
    .m_rresp(ddr_s_rresp),
    .m_rvalid(ddr_s_rvalid),
    .m_wdata(ddr_s_wdata),
    .m_wready(ddr_s_wready),
    .m_wstrb(ddr_s_wstrb),
    .m_wvalid(ddr_s_wvalid),
    .rst_n(sync_rst_n),
    .s_araddr(l2_s_araddr),
    .s_arready(l2_s_arready),
    .s_arvalid(l2_s_arvalid),
    .s_awaddr(l2_s_awaddr),
    .s_awready(l2_s_awready),
    .s_awvalid(l2_s_awvalid),
    .s_bready(l2_s_bready),
    .s_bresp(l2_s_bresp),
    .s_bvalid(l2_s_bvalid),
    .s_rdata(l2_s_rdata),
    .s_rready(l2_s_rready),
    .s_rresp(l2_s_rresp),
    .s_rvalid(l2_s_rvalid),
    .s_wdata(l2_s_wdata),
    .s_wready(l2_s_wready),
    .s_wstrb(l2_s_wstrb),
    .s_wvalid(l2_s_wvalid)
  );
  pcie_top u_pcie (
    .clk(sys_clk),
    .irq(pcie_irq),
    .m_arready(1'h1),
    .m_awready(1'h1),
    .m_bvalid(1'h0),
    .m_rdata(64'h0000000000000000),
    .m_rresp(2'h0),
    .m_rvalid(1'h0),
    .m_wready(1'h1),
    .pcie_perst_n(pcie_perst_n),
    .pcie_refclk_n(pcie_refclk_n),
    .pcie_refclk_p(pcie_refclk_p),
    .pcie_rxn(pcie_rxn),
    .pcie_rxp(pcie_rxp),
    .pcie_txn(pcie_txn),
    .pcie_txp(pcie_txp),
    .rst_n(sync_rst_n),
    .s_araddr(s2_araddr_x),
    .s_arready(s2_arready_x),
    .s_arvalid(s2_arvalid_x),
    .s_awaddr(s2_awaddr_x),
    .s_awready(s2_awready_x),
    .s_awvalid(s2_awvalid_x),
    .s_bready(s2_bready_x),
    .s_bvalid(s2_bvalid_x),
    .s_rdata(s2_rdata_x),
    .s_rready(s2_rready_x),
    .s_rvalid(s2_rvalid_x),
    .s_wdata(s2_wdata_x),
    .s_wready(s2_wready_x),
    .s_wstrb(s2_wstrb_x),
    .s_wvalid(s2_wvalid_x)
  );
  reset_sync  u_reset_sync (
    .async_rst_n(sys_rst_n),
    .clk(sys_clk),
    .sync_rst_n(sync_rst_n)
  );
  sha256_engine u_sha256 (
    .clk(sys_clk),
    .irq(sha_irq),
    .paddr(s7_araddr_x[7:0]),
    .penable(1'h1),
    .prdata(sha_prdata),
    .psel(sha_psel),
    .pwdata(s7_wdata_x[31:0]),
    .pwrite(s7_awvalid_x),
    .rst_n(sync_rst_n)
  );
  spi_master u_spi (
    .clk(sys_clk),
    .irq(spi_irq),
    .paddr(apb_paddr[3:0]),
    .penable(apb_penable),
    .prdata(spi_prdata),
    .pready(spi_pready),
    .psel(spi_psel),
    .pwdata(apb_pwdata),
    .pwrite(apb_pwrite),
    .rst_n(sync_rst_n),
    .spi_clk(spi_clk),
    .spi_csn(spi_csn_w),
    .spi_miso(spi_miso),
    .spi_mosi(spi_mosi)
  );
  trng u_trng (
    .clk(sys_clk),
    .irq(trng_irq),
    .paddr(s7_araddr_x[3:0]),
    .penable(1'h1),
    .prdata(trng_prdata),
    .psel(trng_psel),
    .pwdata(32'd0),
    .pwrite(1'h0),
    .rst_n(sync_rst_n)
  );
  uart_16550 u_uart0 (
    .clk(sys_clk),
    .irq(uart0_irq),
    .paddr(apb_paddr[3:0]),
    .penable(apb_penable),
    .prdata(uart0_prdata),
    .pready(uart0_pready),
    .psel(uart0_psel),
    .pwdata(apb_pwdata),
    .pwrite(apb_pwrite),
    .rst_n(sync_rst_n),
    .rxd(uart0_rxd),
    .txd(uart0_txd)
  );
  uart_16550 u_uart1 (
    .clk(sys_clk),
    .irq(uart1_irq),
    .paddr(apb_paddr[3:0]),
    .penable(apb_penable),
    .prdata(uart1_prdata),
    .pready(uart1_pready),
    .psel(uart1_psel),
    .pwdata(apb_pwdata),
    .pwrite(apb_pwrite),
    .rst_n(sync_rst_n),
    .rxd(uart1_rxd),
    .txd(uart1_txd)
  );
  watchdog_timer u_wdt (
    .clk(sys_clk),
    .irq(wdt_irq),
    .paddr(apb_paddr[3:0]),
    .penable(apb_penable),
    .prdata(wdt_prdata),
    .pready(wdt_pready),
    .psel(wdt_psel),
    .pwdata(apb_pwdata),
    .pwrite(apb_pwrite),
    .rst_n(sync_rst_n),
    .wdt_reset_n(wdt_rst_n)
  );
  axi4_crossbar  u_xbar (
    .clk(sys_clk),
    .m0_araddr(cpu0_dmem_araddr),
    .m0_arid(4'h0),
    .m0_arready(cpu0_dmem_arready),
    .m0_arvalid(cpu0_dmem_arvalid),
    .m0_awaddr(cpu0_dmem_awaddr),
    .m0_awid(4'h0),
    .m0_awready(cpu0_dmem_awready),
    .m0_awvalid(cpu0_dmem_awvalid),
    .m0_bready(cpu0_dmem_bready),
    .m0_bvalid(cpu0_dmem_bvalid),
    .m0_rdata(cpu0_dmem_rdata),
    .m0_rready(cpu0_dmem_rready),
    .m0_rresp(cpu0_dmem_rresp),
    .m0_rvalid(cpu0_dmem_rvalid),
    .m0_wdata(cpu0_dmem_wdata),
    .m0_wlast(1'h1),
    .m0_wready(cpu0_dmem_wready),
    .m0_wstrb(cpu0_dmem_wstrb),
    .m0_wvalid(cpu0_dmem_wvalid),
    .m1_araddr(cpu1_dmem_araddr),
    .m1_arid(4'h1),
    .m1_arready(cpu1_dmem_arready),
    .m1_arvalid(cpu1_dmem_arvalid),
    .m1_awaddr(cpu1_dmem_awaddr),
    .m1_awid(4'h1),
    .m1_awready(cpu1_dmem_awready),
    .m1_awvalid(cpu1_dmem_awvalid),
    .m1_bready(cpu1_dmem_bready),
    .m1_bvalid(cpu1_dmem_bvalid),
    .m1_rdata(cpu1_dmem_rdata),
    .m1_rready(cpu1_dmem_rready),
    .m1_rresp(cpu1_dmem_rresp),
    .m1_rvalid(cpu1_dmem_rvalid),
    .m1_wdata(cpu1_dmem_wdata),
    .m1_wlast(1'h1),
    .m1_wready(cpu1_dmem_wready),
    .m1_wstrb(cpu1_dmem_wstrb),
    .m1_wvalid(cpu1_dmem_wvalid),
    .m2_araddr(cpu2_dmem_araddr),
    .m2_arid(4'h2),
    .m2_arready(cpu2_dmem_arready),
    .m2_arvalid(cpu2_dmem_arvalid),
    .m2_awaddr(cpu2_dmem_awaddr),
    .m2_awid(4'h2),
    .m2_awready(cpu2_dmem_awready),
    .m2_awvalid(cpu2_dmem_awvalid),
    .m2_bready(cpu2_dmem_bready),
    .m2_bvalid(cpu2_dmem_bvalid),
    .m2_rdata(cpu2_dmem_rdata),
    .m2_rready(cpu2_dmem_rready),
    .m2_rresp(cpu2_dmem_rresp),
    .m2_rvalid(cpu2_dmem_rvalid),
    .m2_wdata(cpu2_dmem_wdata),
    .m2_wlast(1'h1),
    .m2_wready(cpu2_dmem_wready),
    .m2_wstrb(cpu2_dmem_wstrb),
    .m2_wvalid(cpu2_dmem_wvalid),
    .m3_araddr(cpu3_dmem_araddr),
    .m3_arid(4'h3),
    .m3_arready(cpu3_dmem_arready),
    .m3_arvalid(cpu3_dmem_arvalid),
    .m3_awaddr(cpu3_dmem_awaddr),
    .m3_awid(4'h3),
    .m3_awready(cpu3_dmem_awready),
    .m3_awvalid(cpu3_dmem_awvalid),
    .m3_bready(cpu3_dmem_bready),
    .m3_bvalid(cpu3_dmem_bvalid),
    .m3_rdata(cpu3_dmem_rdata),
    .m3_rready(cpu3_dmem_rready),
    .m3_rresp(cpu3_dmem_rresp),
    .m3_rvalid(cpu3_dmem_rvalid),
    .m3_wdata(cpu3_dmem_wdata),
    .m3_wlast(1'h1),
    .m3_wready(cpu3_dmem_wready),
    .m3_wstrb(cpu3_dmem_wstrb),
    .m3_wvalid(cpu3_dmem_wvalid),
    .m4_araddr(cpu4_dmem_araddr),
    .m4_arid(4'h4),
    .m4_arready(cpu4_dmem_arready),
    .m4_arvalid(cpu4_dmem_arvalid),
    .m4_awaddr(cpu4_dmem_awaddr),
    .m4_awid(4'h4),
    .m4_awready(cpu4_dmem_awready),
    .m4_awvalid(cpu4_dmem_awvalid),
    .m4_bready(cpu4_dmem_bready),
    .m4_bvalid(cpu4_dmem_bvalid),
    .m4_rdata(cpu4_dmem_rdata),
    .m4_rready(cpu4_dmem_rready),
    .m4_rresp(cpu4_dmem_rresp),
    .m4_rvalid(cpu4_dmem_rvalid),
    .m4_wdata(cpu4_dmem_wdata),
    .m4_wlast(1'h1),
    .m4_wready(cpu4_dmem_wready),
    .m4_wstrb(cpu4_dmem_wstrb),
    .m4_wvalid(cpu4_dmem_wvalid),
    .rst_n(sync_rst_n),
    .s0_araddr(l2_s_araddr),
    .s0_arid(l2_s_rid),
    .s0_arready(l2_s_arready),
    .s0_arvalid(l2_s_arvalid),
    .s0_awaddr(l2_s_awaddr),
    .s0_awid(l2_s_bid),
    .s0_awready(l2_s_awready),
    .s0_awvalid(l2_s_awvalid),
    .s0_bid(l2_s_bid),
    .s0_bready(l2_s_bready),
    .s0_bresp(l2_s_bresp),
    .s0_bvalid(l2_s_bvalid),
    .s0_rdata(l2_s_rdata),
    .s0_rid(l2_s_rid),
    .s0_rlast(1'hx),
    .s0_rready(l2_s_rready),
    .s0_rresp(l2_s_rresp),
    .s0_rvalid(l2_s_rvalid),
    .s0_wdata(l2_s_wdata),
    .s0_wlast(l2_s_wlast),
    .s0_wready(l2_s_wready),
    .s0_wstrb(l2_s_wstrb),
    .s0_wvalid(l2_s_wvalid),
    .s1_araddr(ddr_s_araddr),
    .s1_arid(ddr_s_arid),
    .s1_arlen(ddr_s_arlen),
    .s1_arready(ddr_s_arready),
    .s1_arvalid(ddr_s_arvalid),
    .s1_awaddr(ddr_s_awaddr),
    .s1_awid(ddr_s_awid),
    .s1_awlen(ddr_s_awlen),
    .s1_awready(ddr_s_awready),
    .s1_awsize(ddr_s_awsize),
    .s1_awvalid(ddr_s_awvalid),
    .s1_bid(ddr_s_bid),
    .s1_bready(ddr_s_bready),
    .s1_bresp(ddr_s_bresp),
    .s1_bvalid(ddr_s_bvalid),
    .s1_rdata(ddr_s_rdata),
    .s1_rid(ddr_s_rid),
    .s1_rlast(ddr_s_rlast),
    .s1_rready(ddr_s_rready),
    .s1_rresp(ddr_s_rresp),
    .s1_rvalid(ddr_s_rvalid),
    .s1_wdata(ddr_s_wdata),
    .s1_wlast(ddr_s_wlast),
    .s1_wready(ddr_s_wready),
    .s1_wstrb(ddr_s_wstrb),
    .s1_wvalid(ddr_s_wvalid),
    .s2_araddr(s2_araddr_x),
    .s2_arready(s2_arready_x),
    .s2_arvalid(s2_arvalid_x),
    .s2_awaddr(s2_awaddr_x),
    .s2_awready(s2_awready_x),
    .s2_awvalid(s2_awvalid_x),
    .s2_bready(s2_bready_x),
    .s2_bvalid(s2_bvalid_x),
    .s2_rdata(s2_rdata_x),
    .s2_rready(s2_rready_x),
    .s2_rvalid(s2_rvalid_x),
    .s2_wdata(s2_wdata_x),
    .s2_wready(s2_wready_x),
    .s2_wstrb(s2_wstrb_x),
    .s2_wvalid(s2_wvalid_x),
    .s3_araddr(s3_araddr_x),
    .s3_arready(s3_arready_x),
    .s3_arvalid(s3_arvalid_x),
    .s3_awaddr(s3_awaddr_x),
    .s3_awready(s3_awready_x),
    .s3_awvalid(s3_awvalid_x),
    .s3_bready(s3_bready_x),
    .s3_bvalid(s3_bvalid_x),
    .s3_rdata({ 32'h00000000, s3_rdata_x }),
    .s3_rready(s3_rready_x),
    .s3_rvalid(s3_rvalid_x),
    .s3_wdata(s3_wdata_x),
    .s3_wready(s3_wready_x),
    .s3_wstrb(s3_wstrb_x),
    .s3_wvalid(s3_wvalid_x),
    .s4_araddr(s4_araddr_x),
    .s4_arready(s4_arready_x),
    .s4_arvalid(s4_arvalid_x),
    .s4_awaddr(s4_awaddr_x),
    .s4_awready(s4_awready_x),
    .s4_awvalid(s4_awvalid_x),
    .s4_bready(s4_bready_x),
    .s4_bvalid(s4_bvalid_x),
    .s4_rdata({ 32'hxxxxxxxx, s4_rdata_x[31:0] }),
    .s4_rready(s4_rready_x),
    .s4_rvalid(s4_rvalid_x),
    .s4_wdata(s4_wdata_x),
    .s4_wready(s4_wready_x),
    .s4_wstrb(s4_wstrb_x),
    .s4_wvalid(s4_wvalid_x),
    .s5_araddr(s5_araddr_x),
    .s5_arready(1'h1),
    .s5_arvalid(s5_arvalid_x),
    .s5_awaddr(s5_awaddr_x),
    .s5_awready(1'h1),
    .s5_awvalid(s5_awvalid_x),
    .s5_bready(s5_bready_x),
    .s5_bvalid(1'h0),
    .s5_rdata(64'h0000000000000000),
    .s5_rready(s5_rready_x),
    .s5_rvalid(1'h0),
    .s5_wdata(s5_wdata_x),
    .s5_wready(1'h1),
    .s5_wstrb(s5_wstrb_x),
    .s5_wvalid(s5_wvalid_x),
    .s6_araddr(s6_araddr_x),
    .s6_arready(s6_arready_x),
    .s6_arvalid(s6_arvalid_x),
    .s6_awaddr(s6_awaddr_x),
    .s6_awready(s6_awready_x),
    .s6_awvalid(s6_awvalid_x),
    .s6_bready(s6_bready_x),
    .s6_bvalid(s6_bvalid_x),
    .s6_rdata({ 32'h00000000, s6_rdata_x }),
    .s6_rready(s6_rready_x),
    .s6_rvalid(s6_rvalid_x),
    .s6_wdata(s6_wdata_x),
    .s6_wready(s6_wready_x),
    .s6_wstrb(s6_wstrb_x),
    .s6_wvalid(s6_wvalid_x),
    .s7_araddr(s7_araddr_x),
    .s7_arready(1'h1),
    .s7_arvalid(s7_arvalid_x),
    .s7_awaddr(s7_awaddr_x),
    .s7_awready(1'h1),
    .s7_awvalid(s7_awvalid_x),
    .s7_bready(s7_bready_x),
    .s7_bvalid(s7_awvalid_x),
    .s7_rdata({ 32'h00000000, s7_rdata_x }),
    .s7_rready(s7_rready_x),
    .s7_rvalid(s7_arvalid_x),
    .s7_wdata(s7_wdata_x),
    .s7_wready(1'h1),
    .s7_wstrb(s7_wstrb_x),
    .s7_wvalid(s7_wvalid_x)
  );
  assign apb_pready = 1'hx;
  assign cpu0_imem_arready = 1'h1;
  assign cpu0_imem_rdata = 64'h0000000000000013;
  assign cpu0_imem_rresp = 2'h0;
  assign cpu0_imem_rvalid = cpu0_imem_arvalid;
  assign cpu1_imem_arready = 1'h1;
  assign cpu1_imem_rdata = 64'h0000000000000013;
  assign cpu1_imem_rresp = 2'h0;
  assign cpu1_imem_rvalid = cpu1_imem_arvalid;
  assign cpu2_imem_arready = 1'h1;
  assign cpu2_imem_rdata = 64'h0000000000000013;
  assign cpu2_imem_rresp = 2'h0;
  assign cpu2_imem_rvalid = cpu2_imem_arvalid;
  assign cpu3_imem_arready = 1'h1;
  assign cpu3_imem_rdata = 64'h0000000000000013;
  assign cpu3_imem_rresp = 2'h0;
  assign cpu3_imem_rvalid = cpu3_imem_arvalid;
  assign cpu4_imem_arready = 1'h1;
  assign cpu4_imem_rdata = 64'h0000000000000013;
  assign cpu4_imem_rresp = 2'h0;
  assign cpu4_imem_rvalid = cpu4_imem_arvalid;
  assign irq_sources = { pcie_irq, gem1_irq, gem0_irq, trng_irq, sha_irq, aes_irq, wdt_irq, i2c_irq, spi_irq, gpio_irq, uart1_irq, uart0_irq, 7'h00 };
  assign l2_s_rlast = 1'hx;
  assign link_up_pcie = pcie_irq;
  assign s4_rdata_x[63:32] = 32'hxxxxxxxx;
  assign s5_arready_x = 1'h1;
  assign s5_awready_x = 1'h1;
  assign s5_bvalid_x = 1'h0;
  assign s5_rdata_x = 64'h0000000000000000;
  assign s5_rvalid_x = 1'h0;
  assign s5_wready_x = 1'h1;
  assign s7_arready_x = 1'h1;
  assign s7_awready_x = 1'h1;
  assign s7_bvalid_x = s7_awvalid_x;
  assign s7_rvalid_x = s7_arvalid_x;
  assign s7_wready_x = 1'h1;
  assign spi_csn = spi_csn_w;
endmodule
