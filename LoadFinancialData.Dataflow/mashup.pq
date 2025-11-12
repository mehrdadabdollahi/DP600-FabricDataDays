[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"], DestinationTypeSettings = [Kind = "Table"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared DefaultDestination = Lakehouse.Contents([EnableFolding = false]){[workspaceId = "6bffd50a-e100-429d-b803-84d31edc0c7a"]}[Data]{[lakehouseId = "f4b2d21f-3110-4050-8a5d-eb5b45e8e588"]}[Data];
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "StockMarket_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared StockMarket = let
  Source = Lakehouse.Contents([HierarchicalNavigation = null]),
  #"Navigation 1" = Source{[workspaceId = "6bffd50a-e100-429d-b803-84d31edc0c7a"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[lakehouseId = "f4b2d21f-3110-4050-8a5d-eb5b45e8e588"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Id = "StockMarket", ItemKind = "Table"]}[Data],
  #"Removed columns" = Table.RemoveColumns(#"Navigation 3", {"bidPrice", "askSize"})
in
  #"Removed columns";
shared StockMarket_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "6bffd50a-e100-429d-b803-84d31edc0c7a"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "f4b2d21f-3110-4050-8a5d-eb5b45e8e588"]}[Data],
  TableNavigation = Navigation_2{[Id = "StockMarket_Refined", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
