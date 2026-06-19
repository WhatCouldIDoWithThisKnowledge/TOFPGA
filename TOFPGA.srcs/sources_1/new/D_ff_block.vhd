library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity D_ff_block is
    port(
        E, rs, pr, enable : in std_logic_vector(31 downto 0);
        clk, o : in std_logic;
        Q, nQ : out std_logic_vector(31 downto 0)
    );
end entity D_ff_block;

architecture buffer_11 of D_ff_block is
signal helper : std_logic_vector(10 downto 0) := b"00000000000";
begin
    Generate_loop : for ii in 0 to 10 generate
        D_ff_gen : entity work.D_ff
            port map(
                E => E(ii),
                clk => clk,
                pr => pr(0),
                rs => rs(0),
                enable => enable(0),
                Q => helper(ii),
                nQ => open
            );
    end generate Generate_loop;
    
    Generate_Tristate : for ii in 0 to 10 generate
        Tristate_gen : entity work.Tristate
            port map(
                E => helper(ii),
                enable => o,
                S => Q(ii)
            );
        end generate Generate_Tristate;
end architecture buffer_11;

architecture buffer_32 of D_ff_block is
signal helper : std_logic_vector(31 downto 0) := x"00000";
begin
    Generate_loop : for ii in 0 to 31 generate
        D_ff_gen : entity work.D_ff
            port map(
                E => E(ii),
                clk => clk,
                pr => pr(0),
                rs => rs(0),
                enable => enable(0),
                Q => helper(ii),
                nQ => nQ(ii)
            );
            
    Generate_Tristate : for ii in 0 to 31 generate
        Tristate_gen : entity work.Tristate
            port map(
                E => helper(ii),
                enable => o,
                S => Q(ii)
            );
        end generate Generate_Tristate;
    end generate Generate_loop;
end architecture buffer_32;