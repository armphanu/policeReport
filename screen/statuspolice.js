import React, { useState, useEffect, useContext } from "react";
import {
  Button,
  Platform,
  SafeAreaView,
  StyleSheet,
  Text,
  TextInput,
  TouchableOpacity,
  View,
  Image,
  ScrollView,
  RefreshControl,
} from "react-native";
import {
  Entypo,
  MaterialCommunityIcons,
  MaterialIcons,
  AntDesign,
} from "@expo/vector-icons";
import { Context as AuthContext } from "../context/AuthContext";
import axios from "axios";



const statuspolice = ({ navigation }) => {
  const { state, getReport } = useContext(AuthContext);
  const [report, setreport] = useState([]);
  const [refreshing, setRefreshing] = React.useState(false);

  const onRefresh = React.useCallback(async() => {
    setRefreshing(true);
    wait(2000).then(() => setRefreshing(false));
  }, []);

  useEffect(() => {
    axios
      //use your ip address type in cmd ipconfig***
      .post(`http:/192.168.1.113:3000/statuspolice`,{
          iduser:state.username
      })
      .then((res) => {
        setreport(res.data);
      })
      .catch((err) => {
        console.log(err);
      });
  }, []);


  return (
    <SafeAreaView style={{ backgroundColor: "white", height: "100%" }}>
      <ScrollView
        refreshControl={
          <RefreshControl refreshing={refreshing} onRefresh={onRefresh} />
        }
      >
        {report.map((prop, key) => {
          return (
<View>
	<TouchableOpacity key={key} onPress={() => {navigation.navigate("statuspoliceinfo", {id: prop.id,});}}>
		
      <View style={{flexDirection: 'row', flexWrap:'wrap', backgroundColor: '#1597e5', borderBottomWidth: 1, borderBottomColor: '#E4DFD9'}}>
        <View style={{flexDirection: 'column', width: '20%'}}>
          <View style={{padding: 10}}>
          <Image style={{height: 70, width: 70, borderRadius: 25}} source={{uri:"http://192.168.1.113:3000/"+prop.imagetofind}}/>
          </View>
       
        </View>
        <View style={{flexDirection: 'column', width: '50%', justifyContent: 'center'}}>
        <Text>{prop.dataofpolice}</Text>
        </View>
        <View style={{flexDirection: 'column', width: '30%', justifyContent: 'center'}}>
          <View style={{ flexDirection: "row", flexWrap: "wrap" }}>
            <AntDesign name="calendar" size={15} color="black" />
            <Text style={{ fontSize: 10 }}> {prop.date}</Text>
         </View>
        <Text>{prop.status}</Text>
        </View>
      </View>

	</TouchableOpacity>
</View>
        //     <View>
              
        //       <TouchableOpacity
        //         key={key}
        //         onPress={() => {
        //           navigation.navigate("statuspoliceinfo", {
        //             id: prop.id,
        //           });
        //         }}
        //       >
                  
        //         <View
        //           style={[
        //             styles.container,
        //             {
        //               backgroundColor: "#1597e5",
        //               height: 100,
        //               borderBottomWidth: 1,
        //               borderBottomColor: "#E4DFD9",
        //             },
        //           ]}
        //         >
        //           <View
        //             style={{
        //               width: "15%",
        //               justifyContent: "center",
        //               height: 100,
        //               alignItems: "center",
        //             }}
        //           >
        //             <Image style={{height: 150, width: 150, borderRadius: 25}} source={{uri:"http://192.168.1.113:3000/"+prop.imagetofind}}/>
        //           </View>
        //           <View
        //             style={{
        //               width: "45%",
        //               justifyContent: "center",
        //               height: 100,
        //             }}
        //           >
                     
        //             <Text>{prop.dataofpolice}</Text>
        //           </View>
              
        //           <View
        //             style={{
        //               width: "35%",
        //               justifyContent: "center",
        //               height: 100,
        //             }}
        //           >
        //             <View style={{ flexDirection: "row", flexWrap: "wrap" }}>
        //               <AntDesign name="calendar" size={20} color="black" />
        //               <Text style={{ fontSize: 12 }}> {prop.date}</Text>
        //             </View>
        //             <View style={{ flexDirection: "row", flexWrap: "wrap" }}>
        //               <Text>{prop.status}</Text>
                  
        //             </View>
                   
        //           </View>
        //         </View>
        //       </TouchableOpacity> 
         
                    
              
 
        //  </View>
         );
       })}
        
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: "row",
    flexWrap: "wrap",
    alignItems: "flex-start", // if you want to fill rows left to right
  },
  item: {
    width: "50%", // is 50% of container width
  },
});

export default statuspolice;