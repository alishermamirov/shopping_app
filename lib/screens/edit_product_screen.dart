import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/providers/products.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});
  static const routeName = "/edit-product";

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _imagFormKey = GlobalKey<FormState>();
  var _isImage = true;
  var _product = Product(
      id: UniqueKey().toString(),
      title: "",
      description: "",
      imageUrl: "",
      price: 0.0);

  void submit() {
    setState(() {
      _isImage = _product.imageUrl.isNotEmpty;
    });
    if (_formKey.currentState!.validate() && _isImage) {
      _formKey.currentState!.save();
      print(_product.title);
      Provider.of<Products>(context, listen: false).addProduct(_product);
      Navigator.of(context).pop();
    }
  }

  void saveImage() {
    if (_imagFormKey.currentState!.validate()) {
      _imagFormKey.currentState!.save();
      setState(() {
        _isImage = true;
      });
      Navigator.of(context).pop();
    }
  }

  void showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Rasm url-ini kiriting"),
        content: Form(
          key: _imagFormKey,
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty || !value.contains("http")) {
                return "Iltimos mahsulot nomini kiriting";
              }
              return null;
            },
            onSaved: (newValue) {
              _product = Product(
                id: _product.id,
                title: _product.title,
                description: _product.description,
                imageUrl: newValue!,
                price: _product.price,
              );
            },
            decoration: const InputDecoration(
              labelText: "Url",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.url,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Bekor qilish"),
          ),
          ElevatedButton(
            onPressed: () {
              saveImage();
            },
            child: const Text("Saqlash"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Mahsulot qo'shish"),
        actions: [
          IconButton(
            onPressed: () => submit(),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          // autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 3) {
                      return "Iltimos mahsulot nomini kiriting";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _product = Product(
                      id: _product.id,
                      title: newValue!,
                      description: _product.description,
                      imageUrl: _product.imageUrl,
                      price: _product.price,
                    );
                  },
                  decoration: const InputDecoration(
                    labelText: "Nomi",
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        int.parse(value) < 1) {
                      return "Iltimos mahsulot narxini 0dan katta kiriting";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _product = Product(
                      id: _product.id,
                      title: _product.title,
                      description: _product.description,
                      imageUrl: _product.imageUrl,
                      price: double.parse(newValue!),
                    );
                  },
                  decoration: const InputDecoration(
                    labelText: "Narxi",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 5) {
                      return "Iltimos mahsulot tarifini kiriting";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _product = Product(
                      id: _product.id,
                      title: _product.title,
                      description: newValue!,
                      imageUrl: _product.imageUrl,
                      price: _product.price,
                    );
                  },
                  decoration: const InputDecoration(
                    labelText: "Tarifi",
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 16,
                ),
                Card(
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1, color: _isImage ? Colors.black : Colors.red),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: InkWell(
                    onTap: () => showImageDialog(context),
                    splashColor: Colors.green,
                    highlightColor: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: _product.imageUrl.isEmpty
                          ? Text(
                              "Asosiy rasm urlini kiriting",
                              style: TextStyle(
                                  color: _isImage ? Colors.black : Colors.red),
                            )
                          : Image.network(
                              _product.imageUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
