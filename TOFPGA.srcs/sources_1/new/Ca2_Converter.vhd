library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity Ca2_Converter is
    port(
        E : in std_logic_vector(31 downto 0);
        S : out std_logic_vector(31 downto 0)
    );
end entity Ca2_Converter;

architecture bh of Ca2_Converter is
signal helper : std_logic_vector(31 downto 0) := x"00000";
signal E2 : std_logic_vector(31 downto 0) := x"00001";
begin
    Inverter_block : entity work.Inverter_block
        port map(
            E => E,
            S => helper
        );
    Adder_block : entity work.Adder_block
        port map(
            E1 => E,
            E2 => E2,
            ov => open,
            S => S
        );
end architecture bh;