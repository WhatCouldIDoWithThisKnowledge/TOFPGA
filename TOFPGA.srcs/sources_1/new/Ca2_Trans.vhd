library IEEE;
use IEEE.std_logic_1164.all;


entity Ca2_Trans is
    port(
        numX : in std_logic_vector(10 downto 0);
        S : out std_logic_vector(31 downto 0);
        overflow : out std_logic
    );
end entity Ca2_Trans;

architecture bh of Ca2_Trans is
signal helper : std_logic_vector(31 downto 0) := x"00000";
signal negated : std_logic_vector(10 downto 0) := b"0000000000";

signal E1 : std_logic_vector(31 downto 0) := x"00000";
signal E2 : std_logic_vector(31 downto 0) := x"00000";
begin
    helper(0 to 10) <= numX;
    not_door : entity work.Not_block
        port map(
            E => helper,
            S => negated
        );
    E2(0) <= '1';
    sum : entity work.sum(Ca2)
        port map(
            E1 => negated,
            E2 => x"00000",
            S => S,
            overflow => overflow
        );
    
end architecture bh;