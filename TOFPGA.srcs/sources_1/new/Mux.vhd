library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity Mux is
    port(
        E1, E2 : in std_logic_vector(31 downto 0);
        Sel : in std_logic;
        S : out std_logic_vector(31 downto 0)
    );
end entity Mux;


architecture bit_32 of Mux is
signal helper : std_logic_vector(31 downto 0) := x"00000";
signal not_helper : std_logic_vector(31 downto 0) := x"00000";
begin
    Product_block : entity work.Product_block(Mux)
        port map(
            E1 => E1,
            E2 => helper,
            S => S
        );
    Product_block_2 : entity work.Product_block(Mux)
        port map(
            E1 => E2,
            E2 => not_helper,
            S => S
        );
    
    not_helper(0) <= not Sel;
    helper(0) <= Sel;
end architecture bit_32;