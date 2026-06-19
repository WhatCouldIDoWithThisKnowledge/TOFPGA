library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity Product is
    port(
        E1, E2 : in std_logic;
        S : out std_logic
    );
end entity Product;

architecture bh of Product is
begin
    S <= E1 and E2;
end architecture bh;