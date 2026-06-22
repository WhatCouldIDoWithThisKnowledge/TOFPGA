library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity T_ff_block is
    port(
        E, rs, clk, enable : in std_logic;
        sign : out std_logic_vector(31 downto 0)
    );
end entity T_ff_block;

architecture bh of T_ff_block is
signal helper : std_logic_vector(31 downto 0) := x"00000";
begin
    T_ff : entity work.T_ff
        port map(
            E => '1',
            clk => clk,
            rs => rs,
            enable => E,
            Q => helper(0),
            nQ => open
        );
    Generate_loop : for ii in 1 to 31 generate
        T_ff_ge : entity work.T_ff
            port map(
                E => '1',
                clk => clk,
                rs => rs,
                enable => helper(ii - 1),
                Q => helper(ii),
                nQ => open
            );
        end generate Generate_loop;
end architecture bh;
