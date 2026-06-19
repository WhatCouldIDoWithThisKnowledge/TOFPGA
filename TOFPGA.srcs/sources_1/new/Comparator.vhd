library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity Comparator is
    port(
        E1, E2 : in std_logic_vector(31 downto 0);
        G, E, L : out std_logic
    );
end entity Comparator;

architecture bh of Comparator is
signal inverted : std_logic_vector(31 downto 0) := x"00000";
signal result : std_logic_vector(31 downto 0) := x"00000";
signal is_not_zero1 : std_logic_vector(32 downto 0) := (others => '0');
signal G_helper : std_logic := '0';
signal L_helper : std_logic := '0';
begin
    Ca2_Converter : entity work.Ca2_Converter
        port map(
            E => E2,
            S => inverted
        );
    Adder_block : entity work.Adder_block
        port map(
            E1 => E1,
            E2 => inverted,
            S => result
        );
    not_zero : entity work.Sum_block(is_not_zero)
        port map(
            E1 => E1,
            E2 => (others => '0'),
            S => is_not_zero1(0 to 31)
        );
    is_valid : entity work.Sum_block(is_min_int)
        port map(
            E1 => E1,
            E2 => (others => '0'),
            S => is_not_zero1(1 to 32)
        );
    G_helper <= is_not_zero1(0);
    L_helper <= not (is_not_zero1(0) or is_not_zero1(1));
    E <= (G_helper nor L_helper) and not is_not_zero1(1);
end architecture bh;