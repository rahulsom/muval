node {
    stage('Checkout') {
        checkout scm
    }
//    stage('Pre Build') {
//        sh "./gradlew clean"
//        sh "./gradlew assemble"
//    }
//    stage('Test') {
//        try {
//            sh "./gradlew check"
//        } finally {
//            junit 'build/test-results/**/*.xml'
//        }
//    }
    stage('Report') {
        emailext body: '${DEFAULT_CONTENT}',
                subject: subject,
                to: 'rahul.som@icloud.com'
    }
}

String getSubject() {
    def emoji = [
            STARTED   : '⚡',
            SUCCESSFUL: '✅',
            FAILED    : '❌',
            FAILURE   : '❌'
    ][currentBuild.result]
    "${emoji} ${env.JOB_NAME}/${env.BUILD_NUMBER}"
}
