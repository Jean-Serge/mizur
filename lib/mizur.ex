defmodule Mizur do

  @moduledoc """
  **Mizur** is a tool to simplify the management, conversions  
  and mapping of units. 

  The manipulation of units of measurement try (at best) 
  to be typesafe.
  """

  defmacro __using__(_opts) do 
    quote do 
      use Mizur.System 
      use Mizur.Api
    end
  end

  defmodule Length do 
    use Mizur.System
    type m 
    type dm = m / 10 
    type cm = dm / 10
  end

end
