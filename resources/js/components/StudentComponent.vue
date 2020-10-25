<template>
    <div class="container-full">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card-body">
                    <table v-if="error === ''" class="table table-bordered">
                        <thead>
                        <tr>
                            <th v-for="(student,index) in studentsData[0]">{{ index }}</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="student in studentsData">
                            <td v-for="column in student">{{ column }}</td>
                        </tr>
                        </tbody>
                    </table>
                    <div v-else class="alert alert-danger">
                        {{ error }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        dataRoute: {
            Required: true,
            Type: String
        }
    },
    data() {
        return {
            studentsData: '',
            error: ''
        }
    },
    methods: {
        getStudentsData() {
            axios.get(this.dataRoute).then((response) => {
                    this.studentsData = response.data;
                }
            ).catch((error) => {
                    this.error = error.response.data;
                }
            )
        }
    },
    mounted() {
        this.getStudentsData();
    }
}
</script>
