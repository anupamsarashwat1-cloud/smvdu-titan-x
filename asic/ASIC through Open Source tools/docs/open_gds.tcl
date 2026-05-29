gds read "/home/anupam-sarashwat/Documents/antigravity/cool-hawking/asic/ASIC through Open Source tools/delivery/titan_x_top.gds"
after 1000 {
    magic1 load titan_x_top
    magic1 select top cell
    magic1 expand
    magic1 view
}
