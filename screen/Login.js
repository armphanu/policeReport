import React, {useState, useContext, useEffect} from 'react';
import { Platform, SafeAreaView, StyleSheet, Text, TextInput, TouchableOpacity, View,ImageBackground, Alert } from 'react-native';
import * as Animatable from 'react-native-animatable'

import { Context as AuthContext  } from '../context/AuthContext';
import { Context  as ValidationContext} from '../context/ValidationContext';

import Header from "../components/Hearders";
import Icon from 'react-native-vector-icons/FontAwesome';



const Login = ({navigation}) => {

    const {state, login, tryLocalSignin} = useContext(AuthContext);

    const {validate_Idcard, validate_Password} = useContext(ValidationContext);
    let state1 = useContext(ValidationContext).state;

    const [id_card, setId_Card] = useState("");
    const [password, setPassword] = useState("");
    
    useEffect(() => {tryLocalSignin();}, []);
   

const Check_onsubmit = () =>{
  if(state1.checkIdcard == false && state1.checkPassword == true){
    Alert.alert("IdCrad requirement is invalid.")

  }else if(state1.checkPassword == false && state1.checkIdcard == true){
    Alert.alert("Password requirement is invalid.")
  }
  else if(state1.checkIdcard == false && state1.checkPassword == false){
    Alert.alert("Password and IdCrad requirement is invalid.")
  }
  else{
    login({id_card, password})}

}


  return (
    <View style={styles.screen}>
    <ImageBackground source={require('../assets/bg.png')} style={styles.backgroundImage}>
    <SafeAreaView style={styles.container}>
      <Header title="Police Report"/>
      <View style={[styles.action, {width: '80%'}]}>
        <Icon name='user-o' size={20} />
        <TextInput style={styles.textInput} placeholder="ID CARD" keyboardType="default" placeholderTextColor="white"
          value={id_card}
          onChangeText={(value)=>{setId_Card(value),validate_Idcard(value)
          }}
          
        ></TextInput>
        
      </View>
      {state1.errorIdcard ?
          <Animatable.View animation="fadeInLeft" duration={500}>
           <Text style={{color:"red",left:-36}}>{state1.errorIdcard}</Text>
          </Animatable.View> :null }

      <View style={[styles.action, {width: '80%', marginTop: 35}]}>
        <Icon name='lock' size={30} />
        <TextInput style={styles.textInput} placeholder="Password" keyboardType="default" secureTextEntry={true} placeholderTextColor="white"
          value={password}
          onChangeText={(value)=>{setPassword(value),validate_Password(value)
          }}
         
          ></TextInput>

      </View>
      {state1.errorPassword ? 
          <Animatable.View animation="fadeInLeft" duration={500} style={{flexWrap:"nowrap"}}>
           <Text style={{color:"red",left:25, }}>{state1.errorPassword}</Text>
          </Animatable.View>: null} 

     

      <TouchableOpacity style={[styles.button, {backgroundColor: '#60b45c', marginTop: 35}]}  onPress={() => Check_onsubmit()}>
        <Text style={styles.fontButton}>Log in</Text>
      </TouchableOpacity>
      <TouchableOpacity style={[styles.button, {backgroundColor: '#2596be', marginTop: 15}]}  onPress={() => navigation.navigate("RegisterScreen")}>
        <Text style={styles.fontButton}>Sign Up</Text>
      </TouchableOpacity>

      {state.errorMessage ? 
      <Animatable.View animation="fadeInLeft" duration={500} style={{flexWrap:"nowrap"}}>
           <Text style={{color:"red"}}>{state.errorMessage}</Text>
          </Animatable.View>: null} 
   
    </SafeAreaView>
    </ImageBackground>
  </View>
 
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
  row: {
    flexDirection: "row",
    flexWrap: "wrap",
  },
  fontButton: {
    fontWeight: 'bold',
    color: 'white'
  },
  button: {
    width: '80%',
    height: 40,
    justifyContent: "center",
    alignItems: "center",
  },
  action: {
    flexDirection: 'row',
    marginTop: 10,
    borderBottomWidth: 1,
    borderBottomColor: '#f2f2f2',
    paddingBottom: 5
  },
  textInput: {
    flex: 1,
    marginTop: Platform.OS === 'ios' ? 0 : -12,
    paddingLeft: 10,
    color: '#05375a'
  },
  backgroundImage: {
    flex: 1,
    resizeMode: 'cover', // or 'stretch',
    justifyContent: 'center',
  },
  screen: {
    flex: 1,
  },
  valid:{
    left:150
  }
});

export default Login;
