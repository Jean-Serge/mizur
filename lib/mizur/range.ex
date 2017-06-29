defmodule Mizur.Range do 

  @moduledoc false

  defmacro __using__(_opts) do 
    quote do 
      import Mizur.Range


      @typedoc """
      This type represents a range of `typed_value`.
      """
      @type range :: {
        __MODULE__.Range.t, 
        __MODULE__.Range.t
      }


      defmodule Range do 

        @parent __MODULE__ 
          |> Module.split 
          |> Enum.drop(-1) 
          |> Module.concat

        @moduledoc """
        This module provides a minimalistic approach of Range between 
        two #{@parent} types.
        """

        @typedoc """
        This type represents a range of `typed_value`.
        """
        @type t :: {@parent.t, @parent.t}


        @doc """
        Builds a range between two `typed_value`.
        """
        @spec new(@parent.t, @parent.t) :: t
        def new(%@parent{} = a, %@parent{} = b) do 
          {a, @parent.from(b, to: a.type)}
        end

        @doc """
        Checks if a `range` is increasing.
        """
        @spec increasing?(t) :: boolean
        def increasing?({%@parent{} = a, %@parent{} = b}) do
          @parent.compare(a, to: b) in [:lt, :eq]
        end

        @doc """
        Checks if a `range` is decreasing.
        """
        @spec decreasing?(t) :: boolean
        def decreasing?(range) do
          not increasing?(range)
        end

        @doc """
        Sorts a `range`.
        """
        @spec sort(t) :: t
        def sort({%@parent{} = a, %@parent{} = b}) do 
          case @parent.compare(a, to: b) do
            :lt -> {a, b}
            _ -> {b, a}
          end
        end

      end # End of Range
      

    end # End of quote
  end

end
