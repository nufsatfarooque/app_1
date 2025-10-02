
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

Color color_ = const Color.fromARGB(255, 15, 86, 72);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme, // keeps default sizes
        ),
      ),
      home: const CardInputs(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.program,
    required this.name,
    required this.studentID,
    required this.department,
    required this.imageBytes,
    });
  final String program;
  final String name;
  final String studentID;
  final String department;
  final Uint8List? imageBytes;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*final Random random = Random();

  Color cardCol = const Color.fromARGB(255, 255, 255, 255);

  Color getRandomColor() {
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
  void changeColor(){
    setState(() {
      cardCol = getRandomColor();
    });
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();  //location
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }*/
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: SizedBox(
          width: 320,
          child: Card(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 170,
                      width: 400,
                      color: color_,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Image.asset(
                            'assets/images/IUT LOGO.png',
                            height: 60,
                            width: 60,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'ISLAMIC UNIVERSITY OF TECHNOLOGY',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -70,
                      left: 85,
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: color_,
                            width: 6,
                          ),
                        ),
                        child: ClipRRect(
                          child: widget.imageBytes !=null
                          ? Image.memory(
                            widget.imageBytes!,
                            fit: BoxFit.cover,
                          )
                          : Image.asset(
                            'assets/images/nufsat.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Center(
                  child: SizedBox(
                    width: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 80),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.key),
                            SizedBox(width: 8,),
                            Text(
                              'Student ID',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 15, 86, 72),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 4,),
                              Icon(
                                Icons.circle,
                                color: const Color.fromARGB(255, 62, 205, 212),
                                size: 15,
                              ),
                              
                            SizedBox(width: 8,),
                              Text(
                                //'210041115',
                                widget.studentID,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.account_circle),
                            
                            SizedBox(width: 8,),
                            Text(
                              'Student Name',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              //'NUFSAT FAROOQUE',
                              widget.name,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14,
                                    color: color_,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.school),
                            
                            SizedBox(width: 8,),
                            Text(
                              'Program ',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              'B.Sc in ${widget.program}',
                            //,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: color_,
                              ),
                              
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.account_balance_sharp),
                            
                            SizedBox(width: 8,),
                            Text(
                              'Department ',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              widget.department,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: color_,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.location_city),
                            
                            SizedBox(width: 8,),
                            Text(
                              'Bangladesh',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: color_,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),

                        //ElevatedButton(onPressed: changeColor, child: Text('Change Color'))
                      ],
                    ),
                  ),
                ),
                
                const Spacer(),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: color_,
                  ),
                  child: 
                  Text(
                    'A subsidiary organ of OIC',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CardInputs extends StatefulWidget {
  const CardInputs({super.key});

  @override
  State<CardInputs> createState() => _CardInputsState();
}

class _CardInputsState extends State<CardInputs> {
  TextEditingController _programController = TextEditingController();
  TextEditingController _studentIDController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();

  Uint8List? _pickedImageBytes;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery); // can also use camera
    if (image != null) {
      final bytes = await image.readAsBytes(); // read as Uint8List
      setState(() {
        _pickedImageBytes = bytes as Uint8List?;
      });
    }
  }

  @override
  void dispose() {
    _programController.dispose();
    _nameController.dispose();
    _studentIDController.dispose();
    _departmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Provide data to generate ID card:',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _studentIDController,
                
                decoration: InputDecoration(
                  labelText: 'StudentID',
                  border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Student Name',
                  border: OutlineInputBorder()
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                
                controller: _programController,
                decoration: InputDecoration(
                  labelText: 'Program',
                  border: OutlineInputBorder()
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                
                controller: _departmentController,
                decoration: InputDecoration(
                  labelText: 'Department',
                  border: OutlineInputBorder()
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Select photo for ID card'
              ),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.image),
                label: const Text("Pick Image"),
                           ),
             ),
            if (_pickedImageBytes != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: MemoryImage(_pickedImageBytes! as Uint8List),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: (color_),
                  foregroundColor: (const Color.fromARGB(255, 255, 255, 255)),
                ),
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(
                    builder: 
                    (context) =>
                    MyHomePage(
                      program: _programController.text, 
                      name: _nameController.text, 
                      studentID: _studentIDController.text,
                      department: _departmentController.text,
                      imageBytes: _pickedImageBytes,)));
                }, 
                child: Text('Generate Card',
                style: TextStyle(
                  color: const Color.fromARGB(221, 255, 255, 255),
                  fontWeight: FontWeight.w600,
                ),)),
            )
          ],
        ),
      ),
    );
  }
}
