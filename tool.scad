include <common.scad>

module tool()
{
  difference()
  {
    children();
    // Bolt-hole:
    tcy([0,0,-1], d=boltHoleDia, h=200);
  }
}