import 'package:flutter/material.dart';
import 'package:proapp/widgets/layout.dart';

class FilterPanel extends StatefulWidget {
  final Function(Map<String, dynamic>) onFilterChanged;

  FilterPanel({required this.onFilterChanged});

  @override
  _FilterPanelState createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
  double _minPrice = 0;
  double _maxPrice = 1000000;
  String _selectedDistrict = '';
  String _selectedNeighborhood = '';
  int _selectedRooms = 1;
  int _selectedBathrooms = 1;
  bool _acceptPets = false;
  bool _hasElevator = false;
  String _selectedPropertyType = 'Apartamento';
  String _selectedCondition = 'Nuevo';
  String _selectedEquipment = 'Indiferente';
  List<String> _selectedFeatures = [];

  final List<String> _districts = [
    'Murcia Norte',
    'Murcia Centro',
    'Espinardo'
  ];
  final List<String> _neighborhoods = [
    'Vistabella',
    'El Carmen',
    'Joven Futura',
    'Vistalegre'
  ];
  final List<String> _propertyTypes = ['Apartamento', 'Casa', 'Dúplex'];
  final List<String> _conditions = ['Nuevo', 'A reformar', 'Bueno'];
  final List<String> _equipment = [
    'Indiferente',
    'Cocina equipada',
    'Amueblado'
  ];
  final List<String> _features = [
    'Garaje',
    'Jardín',
    'Piscina',
    'Terraza',
    'Trastero',
    'Accesibilidad',
    'Aire acondicionado'
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: _buildMobileBody(context),
      tabletBody: _buildTabletBody(context),
      desktopBody: _buildDesktopBody(context),
    );
  }

  Widget _buildMobileBody(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('Precio'),
          _buildPriceRange(),
          _buildDivider(),
          _buildSectionTitle('Localización'),
          SizedBox(height: 8.0),
          _buildDropdown('Distrito', _districts, _selectedDistrict,
              (String? value) {
            setState(() {
              _selectedDistrict = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDropdown('Barrio', _neighborhoods, _selectedNeighborhood,
              (String? value) {
            setState(() {
              _selectedNeighborhood = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDivider(),
          _buildSectionTitle('Vivienda'),
          SizedBox(height: 8),
          _buildDropdown(
              'Tipo de vivienda', _propertyTypes, _selectedPropertyType,
              (String? value) {
            setState(() {
              _selectedPropertyType = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDropdown('Estado', _conditions, _selectedCondition,
              (String? value) {
            setState(() {
              _selectedCondition = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDropdown('Equipamiento', _equipment, _selectedEquipment,
              (String? value) {
            setState(() {
              _selectedEquipment = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDivider(),
          _buildDropdown(
              'Habitaciones',
              List.generate(10, (index) => (index + 1).toString()),
              _selectedRooms.toString(), (String? value) {
            setState(() {
              _selectedRooms = int.parse(value!);
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDropdown(
              'Baños',
              List.generate(5, (index) => (index + 1).toString()),
              _selectedBathrooms.toString(), (String? value) {
            setState(() {
              _selectedBathrooms = int.parse(value!);
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildCheckbox('Ascensor', _hasElevator, (bool? value) {
            setState(() {
              _hasElevator = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildCheckbox('Acepta mascotas', _acceptPets, (bool? value) {
            setState(() {
              _acceptPets = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDivider(),
          _buildCheckboxList(),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                _onFilterChanged();
              },
              child: Text('Aplicar filtros'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletBody(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('Precio'),
          _buildPriceRange(),
          _buildDivider(),
          _buildSectionTitle('Localización'),
          SizedBox(height: 8.0),
          _buildDropdown('Distrito', _districts, _selectedDistrict,
              (String? value) {
            setState(() {
              _selectedDistrict = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDropdown('Barrio', _neighborhoods, _selectedNeighborhood,
              (String? value) {
            setState(() {
              _selectedNeighborhood = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDivider(),
          _buildSectionTitle('Vivienda'),
          SizedBox(height: 8),
          _buildDropdown(
              'Tipo de vivienda', _propertyTypes, _selectedPropertyType,
              (String? value) {
            setState(() {
              _selectedPropertyType = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDropdown('Estado', _conditions, _selectedCondition,
              (String? value) {
            setState(() {
              _selectedCondition = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDropdown('Equipamiento', _equipment, _selectedEquipment,
              (String? value) {
            setState(() {
              _selectedEquipment = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDivider(),
          _buildDropdown(
              'Habitaciones',
              List.generate(10, (index) => (index + 1).toString()),
              _selectedRooms.toString(), (String? value) {
            setState(() {
              _selectedRooms = int.parse(value!);
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDropdown(
              'Baños',
              List.generate(5, (index) => (index + 1).toString()),
              _selectedBathrooms.toString(), (String? value) {
            setState(() {
              _selectedBathrooms = int.parse(value!);
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildCheckbox('Ascensor', _hasElevator, (bool? value) {
            setState(() {
              _hasElevator = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildCheckbox('Acepta mascotas', _acceptPets, (bool? value) {
            setState(() {
              _acceptPets = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDivider(),
          _buildCheckboxList(),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                _onFilterChanged();
              },
              child: Text('Aplicar filtros'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Precio'),
          _buildPriceRange(),
          _buildDivider(),
          _buildSectionTitle('Localización'),
          SizedBox(height: 8.0),
          _buildDropdown('Distrito', _districts, _selectedDistrict,
              (String? value) {
            setState(() {
              _selectedDistrict = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDropdown('Barrio', _neighborhoods, _selectedNeighborhood,
              (String? value) {
            setState(() {
              _selectedNeighborhood = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDivider(),
          _buildSectionTitle('Vivienda'),
          SizedBox(height: 8),
          _buildDropdown(
              'Tipo de vivienda', _propertyTypes, _selectedPropertyType,
              (String? value) {
            setState(() {
              _selectedPropertyType = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDropdown('Estado', _conditions, _selectedCondition,
              (String? value) {
            setState(() {
              _selectedCondition = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDropdown('Equipamiento', _equipment, _selectedEquipment,
              (String? value) {
            setState(() {
              _selectedEquipment = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDivider(),
          _buildDropdown(
              'Habitaciones',
              List.generate(10, (index) => (index + 1).toString()),
              _selectedRooms.toString(), (String? value) {
            setState(() {
              _selectedRooms = int.parse(value!);
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDropdown(
              'Baños',
              List.generate(5, (index) => (index + 1).toString()),
              _selectedBathrooms.toString(), (String? value) {
            setState(() {
              _selectedBathrooms = int.parse(value!);
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildCheckbox('Ascensor', _hasElevator, (bool? value) {
            setState(() {
              _hasElevator = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildCheckbox('Acepta mascotas', _acceptPets, (bool? value) {
            setState(() {
              _acceptPets = value!;
              _onFilterChanged();
            });
          }),
          SizedBox(height: 8),
          _buildDivider(),
          _buildCheckboxList(),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                _onFilterChanged();
              },
              child: Text('Aplicar filtros'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildPriceRange() {
    return Column(
      children: [
        RangeSlider(
          values: RangeValues(_minPrice, _maxPrice),
          min: 0,
          max: 1000000,
          divisions: 100,
          labels: RangeLabels(
            '\$${_minPrice.toInt()}',
            '\$${_maxPrice.toInt()}',
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _minPrice = values.start;
              _maxPrice = values.end;
              _onFilterChanged();
            });
          },
        ),
      ],
    );
  }

  Widget _buildDropdown(String title, List<String> items, String selectedItem,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        DropdownButton<String>(
          isExpanded: true,
          value: selectedItem.isNotEmpty ? selectedItem : null,
          hint: Text('Selecciona $title'),
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildCheckbox(
      String title, bool value, ValueChanged<bool?> onChanged) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Text(title),
      ],
    );
  }

  Widget _buildCheckboxList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _features.map((feature) {
        return _buildCheckbox(feature, _selectedFeatures.contains(feature),
            (bool? checked) {
          setState(() {
            if (checked == true) {
              _selectedFeatures.add(feature);
            } else {
              _selectedFeatures.remove(feature);
            }
            _onFilterChanged();
          });
        });
      }).toList(),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 24, color: Colors.black.withOpacity(0.5));
  }

  void _onFilterChanged() {
    widget.onFilterChanged({
      'minPrice': _minPrice,
      'maxPrice': _maxPrice,
      'district': _selectedDistrict,
      'neighborhood': _selectedNeighborhood,
      'propertyType': _selectedPropertyType,
      'condition': _selectedCondition,
      'equipment': _selectedEquipment,
      'rooms': _selectedRooms,
      'bathrooms': _selectedBathrooms,
      'hasElevator': _hasElevator,
      'acceptPets': _acceptPets,
      'features': _selectedFeatures,
    });
  }
}
