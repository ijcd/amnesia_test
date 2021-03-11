use Amnesia

# create a database and define a Book table
defdatabase BookDatabase do
  # sku being the first attribute is immediately an index
  deftable Book, [:sku, :author, :title], type: :ordered_set, index: [:author] do
    @type t :: %Book{sku: String.t, author: String.t, title: String.t}
  end

#  deftable Warehouse, [{:id, autoincrement}, :sku, :price, :count], type: :ordered_set, index: [:sku] do
#    @type t :: %Warehouse{id: non_neg_integer, sku: String.t, price: float, count: non_neg_integer}
#  end
end
