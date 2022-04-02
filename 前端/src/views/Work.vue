<template>
    <div>
        <div>
            <el-form class="block7" :model="createForm">
                <el-form-item prop="article_title">
                    <el-input 
                    type="textarea" 
                    :autosize="{minRows:2,maxRows:100}"
                    placeholder="请输入标题" 
                    class="title1" 
                    resize=none
                    v-model="createForm.article_title">
                    </el-input>
                </el-form-item>
                <el-form-item prop="article_content">
                    <div style="margin: 20px 0"></div>
                    <el-input 
                    type="textarea" 
                    placeholder="请输入正文" 
                    :autosize="{minRows:10,maxRows:100}"
                    resize=none
                    class="content1" 
                    v-model="createForm.article_content">
                    </el-input>
                </el-form-item>
                <el-form-item prop="user_id" style="height:0px">
                    <el-input type="hidden" v-model="createForm.user_id"></el-input>
                </el-form-item>
                <el-button type="primary" @click="submit" style="float:right">发布</el-button>
            </el-form>
        </div>
    </div>
</template>

<script>
export default {
        data() {
            return {
                id: (JSON.parse(sessionStorage.getItem("user"))).user_id,

                activeIndex: '1',
                activeIndex2: '1',

                search:'',
                createForm: {
                    article_title:'',
                    article_content:'',
                    user_id: '',
                },
                dialogVisible: false,
        }
    },
    methods: {
        async submit(){
            if(this.createForm.article_title===''||this.createForm.article_content==='')
            {
                this.$message.warning("发布内容不完整");
            }else{
                console.log(this.createForm);
                const {data:res}=await this.$http.post("work",this.createForm);
                if(res.flag=="success"){
                    this.$message.success("发布成功！");
                    this.$router.push("/home");
                }else{
                    this.$message.warning("发布内容不完整");
                }
            }
        }
    },
    created(){
        this.createForm.user_id=this.id+'';
        console.log(this.createForm.user_id);
    }
}
</script>

<style lang="less" scope="">
.block7 {
    //position: absolute;
    width: 70%;
    height: auto;
    margin-top: 7%;
    margin-left: 15%;
    padding-right: 5%;
    padding-left: 5%;
    padding-top: 5%;
    padding-bottom: 5%;
    // transform: translate(2%, 2%);
    box-sizing: border-box;
    background: rgba(0, 0, 0, 0.5);
    box-shadow: 0px 15px 25px rgba(0, 0, 0, 0.5);
    /*box-sizing设置盒子模型的解析模式为怪异盒模型，
    将border和padding划归到width范围内*/
    //box-shadow: 0px 0px 0px rgba(0, 0, 0, 0.5);
    /*边框阴影  水平阴影0 垂直阴影15px 模糊25px 颜色黑色透明度0.5*/
    border-radius: 15px;
    /*边框圆角，四个角均为15px*/
}
.Img {
    width: 100%;
    height: 100%;
    border-radius: 15px;
}
.title1 {
    height: auto;
    font-size: 20PX;
    font-family: Arial, Helvetica, sans-serif;//字体
}
.content1 {
    height: auto;
    font-size: 14PX;
    font-family: Arial, Helvetica, sans-serif;//字体
}
.title_b {
    word-wrap: break-word;
    margin-left: 2%;
    margin-right: 2%;
    padding-top: 1%;
    display: flow-root;//行对齐
    letter-spacing:2px;
    line-height: 32px!important;
}
.content_b {
    margin-left: 20px;
    margin-right: 15px;
    margin-bottom: 28px;
    font-family: auto;//字体
    display: flow-root;
    white-space:normal; 
    word-break:break-all;
    overflow:hidden;
    // letter-spacing:1px;
    font-size: 16px !important;
    line-height: 26px!important;
    color: rgb(183, 177, 168);

    white-space: pre-wrap;
    white-space: -moz-pre-wrap;
    white-space: -pre-wrap;
    white-space: -o-pre-wrap;

}
</style>

<style>
.search input.el-input__inner {
    border-radius:15px;
    width: 100%;
}
.el-input input::-ms-input-placeholder {
    font-family: Arial, Helvetica, sans-serif;
}
</style>