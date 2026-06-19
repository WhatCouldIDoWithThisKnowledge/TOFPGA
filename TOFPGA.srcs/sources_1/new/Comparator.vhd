library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity Comparator is
    port(
        E1, E2 : in std_logic;
        G, E, L : out std_logic
    );
end entity Comparator;

architecture bh of Comparator is
begin
    G <= E1 and not E2;
    E <= E1 and E2;
    L <= not E1 and E2;
end architecture bh;